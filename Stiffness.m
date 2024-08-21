function stiff=Stiffness(paramsBeam,paramsPZT,Aerodynamic,UW)
global X1p X2p Aero
%%
E=paramsBeam.E;
b=paramsBeam.b;
h=paramsBeam.h;
L=paramsBeam.L;
% pzt
h_a=paramsPZT.h_a;
h_s=paramsPZT.h_s;
c11=paramsPZT.c11;
% Aerodynamic
ro_inf=Aerodynamic.ro_inf;
U_inf=Aerodynamic.U_inf;
M_inf=Aerodynamic.M_inf;
%%
U=UW.U;
W=UW.W;
%%
dUdX=diff(U);
dWdX=diff(W);
dWdX_2=diff(dWdX);
L1=dUdX*dUdX';
L2=dUdX*dWdX_2';
L3=dWdX_2*dWdX_2';
L4=dWdX*W';
%%
K11=E*b*h*int(L1,0,L)+c11*b*h_a*int(L1,X1p,X2p)+...
    .5*c11*b*h_s*int(L1,X1p,X2p);
K12=-.5*c11*b*h_a*(h+h_a)*int(L2,X1p,X2p)+...
    .5*c11*b*h_s*(h+h_s)*int(L2,X1p,X2p);
K21=K12;
K22=(((E*b*h^3)/12))*int(L3,0,L)+...
    c11*b*(.25*(h^2)*h_a+.5*h*(h_a^2)+((h_a^2)/3))*int(L3,X1p,X2p)+...
    c11*b*(.25*(h^2)*h_s+.5*h*(h_s^2)+((h_s^3)/3))*int(L3,X1p,X2p)+...
    -b*(Aero)*int(L4,X1p,X2p);
%%
% K11=E*b*h*trapz(X(1:end-1),L1)+c11*b*h_a*trapz(X(1:end-1),L1)+...
%     c11*b*h_s*trapz(X(1:end-1),L1);
% K12=-.5*c11*b*(h+h_a)*trapz(X(1:end-2), L2)+...
%     c11*b*(h+h_s)*trapz(X(1:end-2), L2);
% K21=K12;
% K22=(((E*b*h^3)/12))*trapz(X(1:end-2),L3)+...
%     c11*b*(.25*(h^2)*h_a+.5*h*h_a+((h_a^2)/3))*trapz(X(1:end-2),L3)+...
%     c11*b*(.25*(h^2)*h_s+.5*h*(h_s^2)+((h_s^3)/3))*trapz(X(1:end-2),L3)+...
%     -b*((ro_inf*(U_inf^2))/sqrt((M_inf^2)-1))*trapz(X(1:end-1),L4);
stiff=[K11,K12;K21,K22];
end