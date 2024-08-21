function Q=ExternalForce(UW,Xf)
syms x
UW=subs(UW.W,x,Xf);
UW=sum(double(UW));
Q=[zeros(1,size(UW,2)),UW];
Q=Q';
end