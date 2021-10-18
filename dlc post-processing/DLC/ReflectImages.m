function numImagesFlipped= ReflectImages(imType, inputDir, outputDir, csvFile)

%[filesFoud, filesProcessed] 
%   = function ReflectImages(pat, inputDir, outputDir, startIndex) 
%The function reads all image files placed in the input
%directory that match the pattern pat (e.g., "*.png"), reflecs the images
%letf to right, and writes them to the directory outputDir. If the optonal
%parameter startIndex is supplied, the function uses it as the index of the
%first file to be processed from the cell array returned by ls(pat). The
%functin returns the number of files found and the number of files
%processed. Notice that the input directory and the output directory should
%include a trailing backslash on Windows or a trailing forward slash on
%Linux.
%cd(inputDir);
file = strsplit(ls(strcat(inputDir,'*',imType)));
filesFound = length(file);

%if nargin > 3
%    firstFile = varargin{1};
%else
%    firstFile = 1;
%end

imgPat = 'img' + digitsPattern(6) + ('.png');

tic
for n = 1:filesFound-1
    fileName = deblank(string(file(n)));
    imgName = extract(fileName,imgPat);
    
    imwrite(fliplr(imread(fileName)), outputDir + imgName);
    numImagesFlipped = n;
end
toc

V = size(imread(fileName));

%flip coordinates in csv file
T = readtable(strcat(inputDir,csvFile));
T(:, 2:2:end) = array2table(V(2) - table2array(T(:, 2:2:end)));
csvFileOut = strcat(outputDir,csvFile);
writetable(T, csvFileOut);