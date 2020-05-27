function bw=adaptivethreshold(IM,ws,C)
%ADAPTIVETHRESHOLD An adaptive thresholding algorithm that seperates the
%foreground from the background with nonuniform illumination.
%  bw=adaptivethreshold(IM,ws,C) outputs a binary image bw with the local 
%   threshold mean-C or median-C to the image IM.
%  ws is the local window size.

mIM=imfilter(IM,fspecial('average',ws),'replicate');
sIM=mIM-IM-C;
bw=im2bw(sIM,0);
