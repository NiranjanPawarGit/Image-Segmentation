project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');
I = imread(strcat(inclass_image_root_dir,'/10_27a.tif'));

level = graythresh(I);
BW = imbinarize(I,level);
fullFileName = fullfile(output_image_root_dir, '10_27a_op.jpg');
imwrite(R, fullFileName);