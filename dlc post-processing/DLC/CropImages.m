function numImagesCropped=CropImages(imType, inputDir, outputDir, csvFile)
%function numImagesCropped=CropImages(imType, inputDir, outputDir, csvFile)
%The funciont a displays the 5th image in the input directiory, inputDir,
%and starts the interactive cropping tool. It then crops all images in the
%intput directory using the interactively specified cropping rectangle and
%save them in the outtput directory, outputDir. It also calculates the
%coordinates of the tracked body parts saved in csvFile in the coordinate
%system of the cropped images and writes them to a CSV file with the same
%name as the original one but placed in the outupt director, outputDir.
%Notice that the names of the input and the output directories should
%contain a trailigh backslash on a Windows platform or a forward slash on a
%Linux or a Mac.
numImagesCropped = 0;
file = strsplit(ls(strcat(inputDir,'*',imType)));
firstFile = 1;
filesFound = length(file);
if filesFound < 5
    return;
end

csvFileIn = strcat(inputDir,csvFile);
T = readtable(csvFileIn);
cropFile = deblank(string(file(5)));
I = imread(cropFile);
[J, rect] = imcrop(I);

imgPat = 'img' + digitsPattern(6) + ('.png');

tic
for n = firstFile:filesFound-1
    fileName = deblank(string(file(n)));
    imgName = extract(fileName,imgPat);

    I = imread(fileName);
    J = imcrop(I, rect);
    imwrite(J, strcat(outputDir, imgName));
    
    t = table2array(T(n, 2:end));
    t(1:2:end) = t(1:2:end) - rect(1);
    t(2:2:end) = t(2:2:end) - rect(2);
    T(n, 2:end) = array2table(t);
    
    numImagesCropped = numImagesCropped+1;
end
toc

csvFileOut = strcat(outputDir,csvFile);
writetable(T, csvFileOut);