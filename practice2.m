a = imread('1.jpg');
a = rgb2gray(a);
s = ones(3)/8;
s(5)=0;
A = filter2(s,a);
A = uint8(A);
subplot(211);
imshow(A);
subplot(212);
imshow(a);

