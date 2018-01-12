lambda01 = [ 1 ; 45 ];
lambda02 = [ 1 ; 400];
lambda03 = [ 45 ; 1 ];

l1 = NewtonNonLineaire(@phi1,@dphi1,lambda01,1e-10);
phi1(l1)
l2 = NewtonNonLineaire(@phi2,@dphi2,lambda02,1e-10);
phi2(l2)
l3 = NewtonNonLineaire(@phi1,@dphi1,lambda03,1e-10);
phi1(l3)