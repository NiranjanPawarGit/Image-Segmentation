% initialise project root and image directories
project_root_dir = strcat(getenv('HOME'), '/comp510project');
inclass_image_root_dir = strcat(project_root_dir, '/inclass');
extras_image_root_dir = strcat(project_root_dir, '/extras');
output_image_root_dir = strcat(project_root_dir, '/output/');


% edge detection on group of coins. Used 3 different algorithms - sobel
% operator, maximum filter and canny edge detector.
rgb_im = imread(strcat(extras_image_root_dir, '/another_coins.jpg'));
gray_im = rgb2gray(rgb_im);
 

% edge detection using sobel operator
smooth_gray_im = imgaussfilt(gray_im, 1);
[~, th] = edge(smooth_gray_im, 'sobel');
fudge_fx = .9;
bw_sobel = edge(smooth_gray_im, 'sobel', th*fudge_fx);

fullFileName = fullfile(output_image_root_dir, 'sobel_another_coins.png');
imwrite(bw_sobel, fullFileName);

% edge detection using canny edge detector
smooth_gray_im = imgaussfilt(gray_im, 2);
[~, th] = edge(smooth_gray_im, 'canny');
fudge_fx = .6;
bw_canny = edge(smooth_gray_im, 'canny', th*fudge_fx);

fullFileName = fullfile(output_image_root_dir, 'canny_another_coins.png');
imwrite(bw_canny, fullFileName);

% edge detection using maximum filter
sharp_gray_im = imsharpen(gray_im, 'Radius', 5, 'Amount', 1); % 1. first use unsharp masking
bw_maxf = maxf(sharp_gray_im, 5) - sharp_gray_im; % subtract original image from maximum filter

fullFileName = fullfile(output_image_root_dir, 'maxf_another_coins.png');
writeim(bw_maxf, fullFileName, 'JPEG');

% elephant using morphology
elph_im = imread(strcat(extras_image_root_dir, '/elephant_identify.jpg'));
gray_elph_im = rgb2gray(elph_im);
I = imbinarize(gray_elph_im, 'global');
I = ~I;

% output progress
fullFileName = fullfile(output_image_root_dir, 'binary_elph.png');
imwrite(I, fullFileName);

e1 = I;
e1 = berosion(e1, 1);
bk_seed = getsinglepixel(e1);
bk_seed = ~bk_seed;
bk_elm = bpropagation(bk_seed, I, 0, -1, 0);

% output progress
conv_bk_elm = uint8(255 * bk_elm);
fullFileName = fullfile(output_image_root_dir, 'elph_bg_elm.png');
imwrite(conv_bk_elm, fullFileName);

elph_body = bskeleton(bk_elm, 0, 'looseendsaway');
e2 = getsinglepixel(elph_body);
e2 = ~e2;
elph_body_seed = getbranchpixel(e2);
elph_body = bpropagation(elph_body_seed, I, 0, -1, 0);

% output final
conv_elph_body = uint8(255 * elph_body);
fullFileName = fullfile(output_image_root_dir, 'elph_body.png');
imwrite(conv_elph_body, fullFileName);


% pillars of hercules
poh_im = imread(strcat(extras_image_root_dir, '/hercules_poles.jpg'));
gray_poh_im = rgb2gray(poh_im);
[~, th] = edge(gray_poh_im, 'sobel');
fudge_fx = .7;
poh_sobel = edge(gray_poh_im, 'sobel', th*fudge_fx);

fullFileName = fullfile(output_image_root_dir, 'sobel_poh.png');
imwrite(poh_sobel, fullFileName);

[~, th] = edge(gray_poh_im, 'canny');
fudge_fx = .9;
poh_canny = edge(gray_poh_im, 'canny', th*fudge_fx);

fullFileName = fullfile(output_image_root_dir, 'canny_poh.png');
imwrite(poh_canny, fullFileName);

