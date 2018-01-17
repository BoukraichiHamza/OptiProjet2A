%% Script de Test de Newton non Linéaire
lambda01 = [ 1 ; 45 ];
lambda02 = [ 1 ; 400];
lambda03 = [ 45 ; 1 ];

disp("---------------------------------------------");
l1 = NewtonNonLineaire(@phi1,@dphi1,lambda01,1e-10);
phi1(l1)
disp("---------------------------------------------");
l2 = NewtonNonLineaire(@phi2,@dphi2,lambda02,1e-10);
phi2(l2)
disp("---------------------------------------------");
l3 = NewtonNonLineaire(@phi1,@dphi1,lambda03,1e-10);
phi1(l3)
disp("---------------------------------------------");
l4 = NewtonNonLineaire(@phi3,@dphi2,lambda02,1e-10);
phi3(l4)
disp("---------------------------------------------");