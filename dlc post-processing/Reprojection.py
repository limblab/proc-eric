#%% Basic Reprojection
import os
import cv2
import numpy as np
import pandas as pd
from tqdm import tqdm
from matplotlib import pyplot as plt
from utils.calibration_utils import *
from utils.vis_utils import extract_specific_frames
from triangulation.triangulate import *
from calibration.extrinsic import *


class reprojection():
    def __init__(self, config, data_path, frame_indices):
        self.config = config
        self.vid_indices = []
        self.data_path = data_path
        self.intrisics = {}
        self.extrinsics = {}
        self.frame_indices = frame_indices
        self.img_format = None
        self.scorer = None
        
        
        
    def _load_camera_matrices(self):
        calib_path = self.config['calibration']['calib_video_path']
        self.intrinsics = load_intrinsics(calib_path, self.vid_indices)
        self.extrinsics = load_extrinsics(calib_path)
        
        
    def _extract_images(self, video_paths, save_paths):
        for video_path, save_path in zip(video_paths, save_paths):
            extract_specific_frames(video_path, self.frame_indices, save_path, self.img_format)
            
            
    def _generate_reprojected_h5(self, save_paths):
        data_3d = pd.read_csv(self.data_path)
        self._load_camera_matrices()
        joints = self.config['labeling']['bodyparts_interested']
        L = len(self.frame_indices)

        iterables = [[self.scorer], joints, ['x', 'y']]
        header = pd.MultiIndex.from_product(iterables, names=['scorer', 'bodyparts', 'coords'])

        data_2ds = []
        
        for save_path, vid_idx in zip(save_paths, self.vid_indices):
            cameraMatrix = np.matrix(self.intrinsics[vid_idx]['camera_mat'])
            distCoeffs = np.array(self.intrinsics[vid_idx]['dist_coeff'])
            Rt = np.matrix(self.extrinsics[vid_idx])
            rvec, tvec = get_rtvec(Rt)

            out = os.path.basename(save_path)
            index = [os.path.join('labeled-data', out, 'img' + str(frame_count).zfill(6) + '.' + self.img_format)
                      for frame_count in self.frame_indices]

            df_2d = pd.DataFrame(np.zeros((L, len(joints)*2)), index=index, columns=header)

            for i, bp in enumerate(tqdm(joints)):
                x = data_3d[bp+'_x'][self.frame_indices].copy()
                y = data_3d[bp+'_y'][self.frame_indices].copy()
                z = data_3d[bp+'_z'][self.frame_indices].copy()

                objectPoints = np.vstack([x,y,z]).T
                coord_2d = np.squeeze(cv2.projectPoints(objectPoints, rvec, tvec, 
                                                        cameraMatrix, distCoeffs)[0], axis=1)
                where_negative = np.argwhere(coord_2d[:,0] < 0)
                where_out1 = np.argwhere(coord_2d[:,0] >= 2048)
                where_out2 = np.argwhere(coord_2d[:,1] >= 1536)
                coord_2d[where_negative, :] = np.nan
                coord_2d[where_out1, :] = np.nan
                coord_2d[where_out2, :] = np.nan

                df_2d.iloc[:, 2*i:2*i+2] = coord_2d

            if not os.path.exists(save_path):
#                os.mkdir(path_to_save)
                 os.mkdir(save_path)
            df_2d.to_hdf(os.path.join(save_path, 'CollectedData_' + self.scorer + '.h5'),
                         key='df_with_missing', mode='w')
            data_2ds.append(df_2d)
        
        
    def reproject(self, video_paths, save_paths, vid_indices, img_format, scorer):
        indices = self.frame_indices
        
        self.vid_indices = vid_indices
        self.img_format = img_format
        self.scorer = scorer
        
        if len(indices) == 0:
            print('Zero frame was selected')
            return

        self._extract_images(video_paths, save_paths)
        self._generate_reprojected_h5(save_paths)
        
    def reproject_no_extraction(self, save_paths, vid_indices, img_format, scorer):
        indices = self.frame_indices
        
        self.vid_indices = vid_indices
        self.img_format = img_format
        self.scorer = scorer
        
        if len(indices) == 0:
            print('Zero frame was selected')
            return

        self._generate_reprojected_h5(save_paths)

            
    def check_reprojections(self, video_paths, image_save_paths, data_save_paths):
        joints = self.config['labeling']['bodyparts_interested']
        data_2ds = [pd.read_hdf(os.path.join(save_path, 'CollectedData_' + self.scorer + '.h5'), 
                                'df_with_missing', header=[1,2], index_col=0) for save_path in data_save_paths]
        for image_save_path, data_2d, vidpath, idx in zip(image_save_paths, data_2ds, video_paths, self.frame_indices):
            if not os.path.exists(image_save_path):
                os.mkdir(image_save_path)

            cap = cv2.VideoCapture(vidpath) 
            fps = cap.get(cv2.CAP_PROP_FPS)
            frame_num = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
            duration = frame_num/fps
            count = len(idx)

            colorclass = plt.cm.ScalarMappable(cmap='jet')
            C = colorclass.to_rgba(np.linspace(0, 1, len(joints)))
            colors = C[:, :3]

            for f, frame_count in enumerate(tqdm(idx)):
                cap.set(cv2.CAP_PROP_POS_FRAMES, frame_count)
                ret, frame = cap.read()
                plt.figure()
                # plt.imshow(frame)
                xs = []
                ys = []
                for joint in joints:
                    xs.append(data_2d[self.scorer, joint, 'x'].iloc[f])
                    ys.append(data_2d[self.scorer, joint, 'y'].iloc[f])

                xs = np.array(xs)
                ys = np.array(ys)

                x0 = np.median(xs[np.isfinite(xs)])
                y0 = np.median(ys[np.isfinite(ys)])

                bbox = [max(x0-50, 0), min(x0+50, frame.shape[1]), max(y0-50, 0), min(y0+50, frame.shape[1])]
                bbox = [int(b) for b in bbox]
                # frame = cv2.transpose()
                frame_cropped = frame[bbox[2]:bbox[3], bbox[0]:bbox[1]]

                plt.imshow(frame_cropped)

                for i, (color, joint) in enumerate(zip(colors, joints)):
                    x = data_2d[self.scorer, joint, 'x'].iloc[f]
                    y = data_2d[self.scorer, joint, 'y'].iloc[f]
                    plt.scatter(x-bbox[0], y-bbox[2], s=15, color=color, marker='o')

                plt.savefig(os.path.join(image_save_path, 'img' + str(frame_count).zfill(6) + '.' + self.img_format),
                            bbox_inches='tight', pad_inches=0)

                plt.close()