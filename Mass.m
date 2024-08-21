function mass=Mass(paramsBeam,paramsPZT,UW)
global X1p X2p
syms x
% format long
% Strucure
ro=paramsBeam.ro;
b=paramsBeam.b;
h=paramsBeam.h;
L=paramsBeam.L;
% pzt
ro_a=paramsPZT.ro_a;
h_a=paramsPZT.h_a;
ro_s=paramsPZT.ro_s;
h_s=paramsPZT.h_s;
%% 
U=UW.U;
W=UW.W;
%%
L1=U*U';
L2=W*W';
M11=ro*b*h.*int(L1,0,L)+ro_a*b*h_a.*int(L1,X1p,X2p)+ro_s*b*h_s.*int(L1,X1p,X2p);
M22=ro*b*h.*int(L2,0,L)+ro_a*b*h_a.*int(L2,X1p,X2p)+ro_s*b*h_s.*int(L2,X1p,X2p);
mass=[M11,zeros(size(M11));zeros(size(M11)),M22];
end
