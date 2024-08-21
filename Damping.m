function damp=Damping(params,paramsPZT,UW)
%%
global X1p X2p
syms x
% format long
% Strucure
b=params.b;
h=params.h;
% pzt
h_a=paramsPZT.h_a;
e31=paramsPZT.e31;
%%
U=UW.U;
W=UW.W;
%%
% for i=1:size(U,1)
% dUdX(i,:)=diff(U(i,:))./diff(X);
% dWdX(i,:)=diff(W(i,:))./diff(X);
% dWdX_2(i,:)=diff(dWdX(i,:))./diff(X(1:end-1));
% end
%%
dUdX=diff(U);
dWdX=diff(W);
dWdX_2=diff(dWdX);
y1=sum(dUdX);
y2=sum(dWdX_2);
%%
%%
C11=-e31*b*int(y1,X1p,X2p);
C12=.5*e31*b*(h+h_a)*int(y2,X1p,X2p);
%%
damp=[C11;C12];
end