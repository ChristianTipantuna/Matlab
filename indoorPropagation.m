
%% Free Space Propagation Model
clc, clear all, close all;

f=2400;             % frequency (MHz)
dp=0.001;           % distance for pathloss(km), d=1m to compute K
d=0.5:0.1:100;      % distance for received power(m)
Pt=17;              % Transmitted power (dBm)
do=1;               % reference distance which in indoor propagation schemes equals 1 meter
n= 2;               % n equals 2 for ideal propagation expressed by the Free Space model.

PL=32.45 + 20*log10(f)+20*log10(dp);  % Path loss Free Space Model
K=-PL;
Pr = Pt + K -10*n*log10(d./do); % 
figure
plot(d,Pr)
grid on;
xlabel('Distance in (m)'); 
ylabel('Received signal'); 

% figure
% [d1, d2] = meshgrid(0:1:100);
% d=sqrt(d1.^2+d2.^2)
% Pr = Pt + K -10*n*log10(d./do); % 
% colormap jet;
% pcolor(d1, d2, Pr)


x1=input('Lenght (m):');
x2=input('Width (m):');
r=input('Resolution (m):')

[d1,d2] = meshgrid(0:1:x1,0:1:x2);
d=sqrt(d1.^2+d2.^2);
disp(d);

disp('Please enter the position of AP1');
x3=input('X - AP position:');
x4=input('Y - AP position:');

[d3,d4] = meshgrid(-x3:1:(x1-x3),-x4:1:(x2-x4));
d5=sqrt(d3.^2+d4.^2);
Pr1 = Pt + K -10*n*log10(d5./do); 
Pr1(Pr1<-50)=-55;
figure
colormap jet
pcolor(d3+x3, d4+x4, Pr1);
colorbar
xlabel('m')
ylabel('m')
hold on;