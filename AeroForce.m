function AeroForce(Aerodynamic,UW)
%
format long
ro_inf=Aerodynamic.ro_inf;
U_inf=Aerodynamic.U_inf;
M_inf=Aerodynamic.M_inf;
%
zita=(ro_inf*(U_inf^2))/sqrt((M_inf^2)-1);
mu=(ro_inf*U_inf)/(((M_inf^2)-1)*sqrt((M_inf^2)-1));
%
RowRox=;
RowRot=;
DeltaP=-zita*RowRox-mu*RowRot;
%%
UW.U=U;
UW.W=W;
%%

end