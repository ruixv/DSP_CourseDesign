% global I1
load('mtlb.mat')
y = mtlb;
sound(y,Fs);
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 40*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
% subplot(121)
image_audio = histeq(image_audio);
% imshow(image_audio)
% title('mtlb')
% subplot(122)
% imhist(image_audio);
I1 = image_audio;
title('mtlb的直方图')
I1 = image_audio;
X = I1;
Fs = 8000;
X = double(X);
X = (X-39.3)/200;
% X = rgb2gray(X);
% X = double(X); 
[m n] = size(X);
music = zeros(m*n,1);
for Li = 1:1:m
    for Lj = 1:1:n
        music((Li-1)*n+Lj) = X(Li,Lj);
    end
end
x = (1:1:63*63)/Fs;
plot(x,music)
xlabel('时间/s')
ylabel('幅度')
% sound(music,Fs);