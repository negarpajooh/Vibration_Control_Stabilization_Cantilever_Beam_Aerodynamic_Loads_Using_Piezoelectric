function Ai=Aii(Ks,paramsPZT)
hs=paramsPZT.h_s;
e33=paramsPZT.e33;
bs=paramsPZT.b_s;
As=hs*bs;
Ks1=Ks.Ks1;
Ks2=Ks.Ks2;
Ai=(hs/(e33*As)).*[Ks1;Ks2];
Ai=Ai';
end