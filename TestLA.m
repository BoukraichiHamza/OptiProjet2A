xc11 = [ 0 ; 1 ; 1 ];
xc12 = [0.5 ; 1.25 ; 1];
xc21 = [ 1 ; 0];
xc22 = [sqrt(3)/2; sqrt(3)/2];

t = 2;
tol  = [1e-6, 1e-10];
lambda = 0;
[x11,flag11,k11,lambda11] = AlgoLagrangienAugmente(@f1,@gradf1,@hessf1,t,xc11,lambda,@C1,@JC1,@hessC1,tol)
[x12,flag12,k12,lambda12] = AlgoLagrangienAugmente(@f1,@gradf1,@hessf1,t,xc12,lambda,@C1,@JC1,@hessC1,tol)
[x21,flag21,k21,lambda21] = AlgoLagrangienAugmente(@f2,@gradf2,@hessf2,t,xc21,lambda,@C2,@JC2,@hessC2,tol)
[x22,flag22,k22,lambda22] = AlgoLagrangienAugmente(@f2,@gradf2,@hessf2,t,xc22,lambda,@C2,@JC2,@hessC2,tol)
