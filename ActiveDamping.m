function Cp=ActiveDamping(paramsPZT,Ks,Kctrl,C)
%%
% pzt
h_s=paramsPZT.h_s;
e33=paramsPZT.e33;
b=paramsPZT.b_s;
As=b*h_s;
%%
C1=(h_s/(e33*As)).*Ks;
%%
Cp=-Kctrl*C1'*C;
end