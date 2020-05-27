project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');

I1 = imread(strcat(extras_image_root_dir,'/jet_fighter_swarm.jpg'));
I = rgb2gray(I1);
I = imcomplement(I);

%--------Otsus Thresholding-------------
level = graythresh(I);
I = I-75;
BW = im2bw(I,level);
%---------------------------------------

fullFileName = fullfile(output_image_root_dir,'jet1.png');
imwrite(BW, fullFileName);