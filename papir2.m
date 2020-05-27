project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');
I = imread(strcat(inclass_image_root_dir,'/papir.jpg'));


R= edge(I,'Roberts');
fullFileName = fullfile(output_image_root_dir, 'papir_2.jpg');
imwrite(R, fullFileName);

BW2 = bwareaopen(R, 40);
fullFileName = fullfile(output_image_root_dir, 'papir_3.jpg');
imwrite(BW2, fullFileName);

se= strel('line',16,120);
BW2=imclose(BW2,se);
fullFileName = fullfile(output_image_root_dir, 'papir_4.jpg');
imwrite(BW2, fullFileName);

se = strel('line',11,90);
m = imdilate(BW2,se);
fullFileName = fullfile(output_image_root_dir, 'papir_dilate.jpg');
imwrite(m, fullFileName);


T = adaptthresh(I,0.45,'ForegroundPolarity','dark');

c = imbinarize(I,T);


Z=c+m;
fullFileName = fullfile(output_image_root_dir, 'papir_5.jpg');
imwrite(Z, fullFileName);


%BW2 = bwareaopen(R, 50);

%figure(4),imshow(BW2);
%R= edge(c,'Roberts');figure(4),imshow(R);
%figure(5),imshow(imfill(R,'holes'));

%BW_out = bwpropfilt(BW_out,'Area', [50, 60]);
%BW_out = bwpropfilt(BW_out,'Solidity',[0.5, 1]);
%label= bwlabel(c);
%m= max(max(label));

