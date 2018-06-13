clear all
load('mtlb.mat')
y = mtlb
y1 = y(:,1);
size_self = floor(sqrt(length(y)));
image_audio = zeros(size_self,size_self);
min_y1 = min(y1);
y2 = 50*(y1- min_y1);
y2 = uint8(y2);
for Li=1:1:size_self
    for Lj=1:1:size_self
%         image_audio(Li,Lj) = floor((y2((Li-1)*size_self +Lj)));
        image_audio(Li,Lj) = (y2((Li-1)*size_self +Lj));
    end
end
image_audio = uint8(image_audio);
subplot(421)

imshow(image_audio)
title('matlab_p')
imwrite(image_audio,'matlab.jpg')
