clear
clc
close

Img = imread('skeleton_orig.tif');
Img = im2double(Img);


% Sobel filter (One derivative)
h1 = [-1 -2 -1;0 0 0; 1 2 1];
h1 = fspecial('sobel');
g1 = imfilter(Img,h1);  %% write the code yourself to fullfill the function of "imfilter"
figure(1);
subplot(121);imshow(Img);
title('the original image');
b1 = mat2gray(g1);
subplot(122);imshow(b1);
title('the Sobel gradient');


% Averaging filter
h2 = fspecial('average',5);
g2 = imfilter(g1,h2);
figure(2);
subplot(121);imshow(Img);
title('the original image');
%b1 = mat2gray(g1);
subplot(122);imshow(g2);
title('the averaging filter');


% Laplacian filter (Second derivative)
h3 = [0 1 0;1 -4 1; 0 1 0];
g3 = imfilter(Img,h3);
figure(3);
subplot(121);imshow(Img);
title('the original image');
subplot(122);imshow(g3);
title('the Laplacian image');

g4=Img-g3;
figure(4);
subplot(121);imshow(g4);
title('Sharped image by adding laplacian filtered and original iamge');
g5=g4.*g2;
subplot(122);imshow(g5);
title('the product of smoothed and laplacian image');

g6 = abs(g5+Img);
figure(5)
subplot(121);imshow(g6);
title('the sum of product and original image');

gamma = 0.5;
c = 1;
g7=c.*g6.^gamma;
subplot(122);imshow(g7);
title('the end result of combine the sharping and gradient operation');
