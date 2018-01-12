x011 = [1;0;0];
x012 = [10;3;-2.2];
x021 = [-1.2 ; 1];
x022 = [10 ; 0];
x023 = [0 ; 0.5*10^(-2) + 10^(-12)];
tol = [1e-6, 1e-10];
deltamax = 1e8;
delta011 = 2*norm(gradf1(x011));
delta012 = 2*norm(gradf1(x012));
delta021 = 2*norm(gradf2(x021));
delta022 = 2*norm(gradf2(x022));
delta023 = 2*norm(gradf2(x023));
gamma = [ 0.5 ; 2 ];
eta = [ 0.01 ; 0.2 ];

AffichageRdC(x011,@f1,@gradf1,@hessf1,tol,deltamax,delta011,gamma,eta);
AffichageRdcMS(x011,@f1,@gradf1,@hessf1,tol,deltamax,delta011,gamma,eta);

AffichageRdC(x012,@f1,@gradf1,@hessf1,tol,deltamax,delta012,gamma,eta);
AffichageRdcMS(x012,@f1,@gradf1,@hessf1,tol,deltamax,delta012,gamma,eta);

AffichageRdC(x021,@f2,@gradf2,@hessf2,tol,deltamax,delta021,gamma,eta);
AffichageRdcMS(x021,@f2,@gradf2,@hessf2,tol,deltamax,delta021,gamma,eta);

AffichageRdC(x022,@f2,@gradf2,@hessf2,tol,deltamax,delta022,gamma,eta);
AffichageRdcMS(x022,@f2,@gradf2,@hessf2,tol,deltamax,delta022,gamma,eta);

AffichageRdC(x023,@f2,@gradf2,@hessf2,tol,deltamax,delta023,gamma,eta);
AffichageRdcMS(x023,@f2,@gradf2,@hessf2,tol,deltamax,delta023,gamma,eta);