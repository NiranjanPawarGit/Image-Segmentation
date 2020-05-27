project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');
[im1,map]=imread(strcat(inclass_image_root_dir,'/son1.gif'));
if ~isempty(map)
    im1 = ind2rgb(im1,map);
end

im1=mat2gray(im1);

%------------------Adaptive threshold-------------------------
bwim1=adaptivethreshold(im1,11,0.025,0);
%-------------------------------------------------------------

bwim1=imcomplement(bwim1);
fullFileName = fullfile(output_image_root_dir,'son1_final.png');
imwrite(bwim1, fullFileName);
