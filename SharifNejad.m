clear;
clc;
close all;
format long
global M K C Q Cp T1 ...
     X1p X2p Ks  Baero Aero C1 Gain Kctrl
%%
X1p=0;X2p=.3;
Baero=30;
%% properties
% Aerodynamic
Aerodynamic.ro_inf=1.23; % Density of Freestream 1.23
Aerodynamic.U_inf=680; % Velocity of Freestream
Aerodynamic.M_inf=2; % Mach Number
% Strucure
paramsBeam.E=70e9;
paramsBeam.ro=2710;
paramsBeam.b=0.03;
paramsBeam.L=0.3;
paramsBeam.h=0.03;
% pzt
paramsPZT.E=49e9;
paramsPZT.ro_a=7500;
paramsPZT.h_a=0.0002;
paramsPZT.b_a=0.03;
paramsPZT.ro_s=7600;
paramsPZT.h_s=0.0005;
paramsPZT.b_s=0.03;
paramsPZT.c11=12.4;
paramsPZT.e31=-6.5;
paramsPZT.e33=1.3e-8;
%%
% ParamsBeam=[paramsBeam.E,paramsBeam.ro,paramsBeam.b,paramsBeam.L,paramsBeam.h];
%% 
Chi=(paramsBeam.L^3)/(paramsBeam.E*(paramsBeam.h^3));
Aero=Chi\Baero;
X=0:0.01:paramsBeam.L;
gamaL1=[1.875104, 4.694091,7.854757,10.995541];
Xforce=paramsBeam.L;
%% Mode Shape
UW=ModeShape(gamaL1,paramsBeam);
%%
M=Mass(paramsBeam,paramsPZT,UW);
M=double(M);
%%
K=Stiffness(paramsBeam,paramsPZT,Aerodynamic,UW);
K=double(K);
[T1,T2]=eig(K,M);
%%
C=Damping(paramsBeam,paramsPZT,UW);
C=double(C);
%% Force
Q=ExternalForce(UW,Xforce);
%% Controller
Ks=stiffCtrl(paramsPZT,paramsBeam,UW);
C1=Aii(Ks,paramsPZT);
%%
% Kctrl=0.0001;
Kctrl=1.*eye(2);
Cp=-Kctrl*C1'*C';
Gain=-Kctrl*C1';
Gain=Gain';
%% Simulation
button = questdlg('Plz Select Model ?','Model Selection','1','2','3','1');
switch button
    case '1'
      Model='Model - 1';
      Kctrl=1e-5;
    case '2'
       Model='Model - 2';
       Kctrl=7e-5;
    case '3'
      Model='Model - 3';
      Kctrl=1e-6;
end
sim('Model_1');
%%
Plotting(Input,Va,Vs,X,Xc,Xdot,Xdotc,Model)

