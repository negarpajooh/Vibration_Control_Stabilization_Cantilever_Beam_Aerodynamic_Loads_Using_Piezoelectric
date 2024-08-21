clc;
tfn=3;

intervalt=[0 tfn];
[dt dz]=ode23('subprog',intervalt,[0 0 0 0]);

figure(1)
subplot(2,2,1)
plot(dt,dz(:,1))
xlabel('time (sec)'),ylabel('z_1')

subplot(2,2,2)
plot(dt,dz(:,2))
xlabel('time (sec)'),ylabel('z_2')

subplot(2,2,3)
plot(dt,dz(:,3))
xlabel('time (sec)'),ylabel('z_3')

subplot(2,2,4)
plot(dt,dz(:,4))
xlabel('time (sec)'),ylabel('z_4')