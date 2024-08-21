clear;
clc;
close all
%%
% Iran.Porvince.Tehran.Damavand=[1,2,3,4];
% Iran.Porvince.Tehran.Varamin=[5,6,7,8];
% Iran.Porvince.Tehran.SharRey=[9,10,11,12];
% Iran.Porvince.Tehran.EslamShar=[13,14,15,16];
% 
% Iran.Porvince.Shiraz.s1=[1,2,3,4];
% Iran.Porvince.Shiraz.s2=[5,6,7,8];
% Iran.Porvince.Shiraz.s3=[9,10,11,12];
% Iran.Porvince.Shiraz.s4=[13,14,15,16];
% 
% Iran.Porvince.Ahvaz.a1=[1,2,3,4];
% Iran.Porvince.Ahvaz.a2=[5,6,7,8];
% Iran.Porvince.Ahvaz.a3=[9,10,11,12];
% Iran.Porvince.Ahvaz.a4=[13,14,15,16];
%%
x=0:pi/10:2*pi;
y1=sin(x);
y2=cos(x);
figure
plot(x,y1,'*k--')
hold on
plot(x,y2,'g')
grid minor
xlabel('X-m')
ylabel('Y-Watt')
title('Wave Energy')
legend('sin(x)','cos(x)')
xlim([0,6])
ylim([-1.5,1.5])
% axis auto
%%
% figure
% subplot(2,3,1)
% plot(x,y1,'k')
% subplot(2,3,2)
% plot(x,y2,'g')
% subplot(2,3,3)
% plot(x,y2,'g')
% subplot(2,3,4)
% plot(x,y2,'g')
% subplot(2,3,5)
% plot(x,y2,'g')
% subplot(2,3,6)
% plot(x,y2,'g')