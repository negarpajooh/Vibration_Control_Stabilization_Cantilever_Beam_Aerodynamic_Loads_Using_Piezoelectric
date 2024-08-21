function  Plotting(Input,Va,Vs,X,Xc,Xdot,Xdotc,Model)
%% Defaults for this blog post
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =16 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
%% load

% load('Archive')
t=X.time;
X=X.signals.values;
Xdot=Xdot.signals.values;
Xc=Xc.signals.values;
Xdotc=Xdotc.signals.values;
% PotentialEnergy=Archive(ii).PotentialEnergy.signals.values;
% KinematicEnergy=Archive(ii).KinematicEnergy.signals.values;
Va=Va.signals.values;
Vs=Vs.signals.values;
Input=Input.signals.values;
% a1=Archive.Kctrl(1,1);
% a2=Archive.Kctrl(2,2);
%% Plots
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,X(:,1))
hold on
plot(t,Xc(:,1),'r')
xlabel('time - s');
ylabel('p(t) - m');
legend('Uncontrol','Control');
title('Flexural Displacemet')
grid on
subplot(3,1,2)
plot(t,X(:,1))
hold on
plot(t,Xc(:,1),'r')
xlabel('time - s');
ylabel('p(t) - m');
legend('Uncontrol','Control');
grid on
xlim([0,0.01]);
subplot(3,1,3)
plot(t,Xc(:,1),'r')
xlabel('time - s');
ylabel('p(t) - m');
legend(Model);
grid minor
xlim([0,0.01]);
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
figure(2)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(3,1,1)
plot(t,X(:,2))
hold on
plot(t,Xc(:,2),'r')
xlabel('time - s');
ylabel('r(t) - m');
legend('Uncontrol','Control');
title('Longtudinal Displacemet')
grid on
subplot(3,1,2)
plot(t,X(:,2))
hold on
plot(t,Xc(:,2),'r')
xlabel('time - s');
ylabel('r(t) - m');
legend('Uncontrol','Control');
grid on
xlim([0,0.01]);
subplot(3,1,3)
plot(t,Xc(:,2),'r')
xlabel('time - s');
ylabel('r(t) - m');
legend(Model);
grid on
xlim([0,0.01]);
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%% Va Vs
figure(3)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,1,1)
plot(t,Va(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
title('Actuator Voltage')
grid on
subplot(2,1,2)
plot(t,Va(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
grid on
xlim([0,0.01]);
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%%
figure(4)
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*150, height*300]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
subplot(2,2,1)
plot(t,Vs(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
title('Sensor Voltage - Flexural')
% legend('Longtudinal')
grid on
subplot(2,2,3)
plot(t,Vs(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
% legend('Flexural')
grid on
xlim([0,0.01]);
subplot(2,2,2)
plot(t,Vs(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
title(' Sensor Voltage-Longtudinal')
% legend('Longtudinal')
grid on
subplot(2,2,4)
plot(t,Vs(:,1))
xlabel('time - s');
ylabel('Amplitude - Volt');
% legend('Flexural')
grid on
xlim([0,0.001]);
set(gcf,'InvertHardcopy','on');
set(gcf,'PaperUnits', 'inches');
papersize = get(gcf, 'PaperSize');
left = (papersize(1)- width)/2;
bottom = (papersize(2)- height)/2;
myfiguresize = [left, bottom, width, height];
set(gcf,'PaperPosition', myfiguresize);
%% Input
figure(5)
subplot(2,1,1)
plot(t,Input(:,1),'r','linewidth',2)
xlabel('time - s');
ylabel('Amplitude -N');
title('Input');
grid on
subplot(2,1,2)
plot(t,Input(:,1),'r','linewidth',2)
xlabel('time - s');
ylabel('Amplitude -N');
xlim([0,0.0001])
grid on
%% Comparison Archive(ii).X.signals.values
% X1=Archive(1).X.signals.values;
% t1=Archive(1).X.time;
% X2=Archive(2).X.signals.values;
% t2=Archive(2).X.time;
% X3=Archive(3).X.signals.values;
% t3=Archive(3).X.time;
% X4=Archive(4).X.signals.values;
% t4=Archive(4).X.time;
% X5=Archive(5).X.signals.values;
% t5=Archive(5).X.time;
% X6=Archive(6).X.signals.values;
% t6=Archive(6).X.time;
% %
% X1c=Archive(1).Xc.signals.values;
% t1c=Archive(1).Xc.time;
% X2c=Archive(2).Xc.signals.values;
% t2c=Archive(2).Xc.time;
% X3c=Archive(3).Xc.signals.values;
% t3c=Archive(3).Xc.time;
% X4c=Archive(4).Xc.signals.values;
% t4c=Archive(4).Xc.time;
% X5c=Archive(5).Xc.signals.values;
% t5c=Archive(5).Xc.time;
% X6c=Archive(6).Xc.signals.values;
% t6c=Archive(6).Xc.time;
% %
% figure(5)
% pos = get(gcf, 'Position');
% set(gcf, 'Position', [pos(1) pos(2) width*100, height*300]); %<- Set size
% set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
% % subplot(3,1,1)
% plot(t1,X1(:,1))
% hold on
% plot(t1c,X1c(:,1),'r')
% hold on
% plot(t2c,X2c(:,1),'k')
% hold on
% plot(t3c,X3c(:,1),'g')
% hold on
% plot(t4c,X4c(:,1),'c')
% hold on
% plot(t5c,X5c(:,1),'m')
% hold on
% plot(t6c,X6c(:,1),'y')
% xlabel('time - s');
% ylabel('p(t) - m');
% legend('Uncontrol','Control');
% title('r(t)')
% grid on
% set(gcf,'InvertHardcopy','on');
% set(gcf,'PaperUnits', 'inches');
% papersize = get(gcf, 'PaperSize');
% left = (papersize(1)- width)/2;
% bottom = (papersize(2)- height)/2;
% myfiguresize = [left, bottom, width, height];
% set(gcf,'PaperPosition', myfiguresize);

end