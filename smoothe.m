project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');

a= imread(strcat(inclass_image_root_dir, '/10_27d.tif'));

[r,c]=size(a);

br=150;
bc=127;
bseg= block(a);
kk=0;
for i=1:2
    for j=1:2
        z=kk+j;
        k=graythresh(bseg(:,:,z));
        m= im2bw(bseg(:,:,z),k);
       
        subplot(2,2,z)
        imshow(m)
    end
    kk=kk+(2);
end

