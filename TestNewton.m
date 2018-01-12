x011 = [1;0;0];
x012 = [10;3;-2.2];
x021 = [-1.2 ; 1];
x022 = [10 ; 0];
x023 = [0 ; 0.5*10^(-2) + 10^(-12)];
tol = [1e-6, 1e-10];

AffichageNewton(@f1,x011,tol,@gradf1,@hessf1);
AffichageNewton(@f1,x012,tol,@gradf1,@hessf1);
AffichageNewton(@f2,x021,tol,@gradf2,@hessf2);
AffichageNewton(@f2,x022,tol,@gradf2,@hessf2);
AffichageNewton(@f2,x023,tol,@gradf2,@hessf2);
