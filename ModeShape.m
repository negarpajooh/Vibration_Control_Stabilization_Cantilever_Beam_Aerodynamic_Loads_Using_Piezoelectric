function UW=ModeShape(gamaL1,paramsBeam)
% format long
syms x
% global x
gamaL=gamaL1;
L=paramsBeam.L;
%% Cantilever
for i=1:4
%     for j=1:numel(X)
% i=1;
U1(i)=sin(((2*i-1)*(pi*x))/2*L);
An=-((cosh(gamaL(i))+cos(gamaL(i)))/(sinh(gamaL(i))+sin(gamaL(i))));
W1(i)=cosh(gamaL(i)*x)-cos(gamaL(i)*x)+An*(sinh(gamaL(i)*x)-sin(gamaL(i)*x));
% An=-((sin(gamaL(i))+sinh(gamaL(i)))/(cos(gamaL(i))+cosh(gamaL(i))));
% W1(i)=sin(gamaL(i)*x)-sinh(gamaL(i)*x)+An*(cos(gamaL(i)*x)-cosh(gamaL(i)*x));

end;
% end

% for i=1:4
% U1(i)=sin((2*i-1)*(pi*x)/2*L);
% W1(i)=cosh(gamaL(i)*x)-cos(gamaL(i)*x)-((cosh(gamaL(i))+cos(gamaL(i)))/(sinh(gamaL(i))+sin(gamaL(i))))*(sinh(gamaL(i)*x)-sin(gamaL(i)*x));
% end
% U=sum(U1);
% W=sum(W1);
UW.U=U1;
UW.W=W1;
%%


end