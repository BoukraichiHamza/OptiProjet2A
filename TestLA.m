%% Script de Test pour l'algorithme du LagrangienAugmente
xc11 = [ 0 ; 1 ; 1 ];
xc12 = [0.5 ; 1.25 ; 1];
xc21 = [ 1 ; 0];
xc22 = [sqrt(3)/2; sqrt(3)/2];

t = 2;
tol  = [1e-8, 1e-8];
lambda = 0;
 AffichageLA(@f1,@gradf1,@hessf1,t,xc11,lambda,@C1,@JC1,@hessC1,tol);
 AffichageLA(@f1,@gradf1,@hessf1,t,xc12,lambda,@C1,@JC1,@hessC1,tol);
 AffichageLA(@f2,@gradf2,@hessf2,t,xc21,lambda,@C2,@JC2,@hessC2,tol);
 AffichageLA(@f2,@gradf2,@hessf2,t,xc22,lambda,@C2,@JC2,@hessC2,tol);
