project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');

I1 = imread(strcat(extras_image_root_dir,'/group_of_coins.jpg'));
I= imcomplement(I1);
I = I-45;
level = graythresh(I);
BW = im2bw(I,level);

se = strel('line',3,80)
erodedBW = imerode(BW,se);

BW2 = imfill(erodedBW,'holes');


% BW2 = imfill(BW,'holes');
% imshowpair(BW,BW2,'montage')



fullFileName = fullfile(output_image_root_dir,'group_of_coins_inclass.png');
imwrite(BW2, fullFileName);