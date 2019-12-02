clear;
clc;

[s,fs]= audioread('C:\Users\Administrator\Desktop\Lab2\test.wav');%×xÈ¡test™n°¸

time=(1:length(s))/fs;
figure(1);
subplot(2,1,1);
plot(time,s);
subplot(2,1,2);
spectrogram(s,256,250,[],fs,'yaxis');

figure(2);
h1=[1 -1 0];         %Forward differernt   
p1=conv(s,h1);
time2=(1:length(p1))/fs;
subplot(6,2,1);
plot(time2,p1);
subplot(6,2,2);
spectrogram(p1,256,250,[],fs,'yaxis');
audiowrite('C:\Users\Administrator\Desktop\Lab2\Forward_differ.wav',p1,fs);
figure(3);
myfrequ(h1);


h2=[0 1 -1];         %Backward different
p2=conv(s,h2);
time3=(1:length(p2))/fs;
subplot(6,2,3);
plot(time3,p2);
subplot(6,2,4);
spectrogram(p2,256,250,[],fs,'yaxis');
audiowrite('C:\Users\Administrator\Desktop\Lab2\Backward_differ.wav',p2,fs);
figure(4);
myfrequ(h2);


h3=ones(1,30);    %acc
p3=conv(s,h3);
time4=(1:length(p3))/fs;
subplot(6,2,5);
plot(time4,p3);
subplot(6,2,6);
spectrogram(p3,256,250,[],fs,'yaxis');
audiowrite('C:\Users\Administrator\Desktop\Lab2\acc.wav',p3,fs);
figure(5);
myfrequ(h3);


h4=zeros(1,5000);       %dealy
h4(3500)=1;
p4=conv(s,h4);
time5=(1:length(p4))/fs;
subplot(6,2,7);
plot(time5,p4);
subplot(6,2,8);
spectrogram(p4,256,250,[],fs,'yaxis');
audiowrite('C:\Users\Administrator\Desktop\Lab2\delay.wav',p4,fs);
figure(6);
myfrequ(h4);


M1=-40;                 %moving average
M2= 50;
h5=zeros(1,100);
h5(-M1:M2) = 1/(M1+M2+1);
p5=conv(s,h5);
time6=(1:length(p5))/fs;
subplot(6,2,9);
plot(time6,p5);
subplot(6,2,10);
spectrogram(p5,256,250,[],fs,'yaxis');
audiowrite('C:\Users\Administrator\Desktop\Lab2\moving_average.wav',p5,fs);
figure(7);
myfrequ(h5);








