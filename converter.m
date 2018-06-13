[FileName,PathName] = uigetfile({'*.m4a;*.mp3'},'Select mp3 File');
path = strcat(PathName,FileName);
[y,Fs] = audioread(path);
% y = y(:,1);
t = 0.00001:0.00001:length(y)/100000;
subplot(211)
plot(t,y)
sound(y,Fs)
% 
% pause(5)
% y = load('Re_p.mat','y');
% y = y.y;
% % y = y(1:4001)
% Fs = load('Re_p.mat','Fs');
% Fs = Fs.Fs;
% t = 1:1:length(y);
% subplot(212)
% plot(t,y);
% sound(y,Fs);