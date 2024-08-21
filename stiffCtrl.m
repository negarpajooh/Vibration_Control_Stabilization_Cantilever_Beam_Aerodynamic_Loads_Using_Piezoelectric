function Ks=stiffCtrl(paramsPZT,paramsBeam,UW)
%%
global X1p X2p
% format long
% Strucure
b=paramsBeam.b;
h=paramsBeam.h;
% pzt
h_s=paramsPZT.h_s;
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
% for j=1:size(dUdX,2)
%     L1(:,j)=sum(dUdX(:,j));
% end
% for j=1:size(dWdX_2,2)
%     L2(:,j)=sum(dWdX_2(:,j));
% end
dUdX=diff(U);
dWdX=diff(W);
dWdX_2=diff(dWdX);
L1=sum(dUdX);
L2=sum(dWdX_2);
%%
Ks1=double(-e31*b*int(L1,X1p,X2p));
%
Ks2=double(.5*e31*b*(h+h_s)*int(L2,X1p,X2p));
Ks.Ks1=Ks1;
Ks.Ks2=Ks2;
end