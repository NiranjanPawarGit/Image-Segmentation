project_root_dir = strcat(getenv('HOME'), '/comp510project');
output_image_root_dir = strcat(project_root_dir, '/output/');

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
