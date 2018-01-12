function [x,flag,k,lambda] = AlgoLagrangienAugmente(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol)


%Données initiales
eta0_a = 0.1258925;
eta0 = 0.1;
alpha = 0.1;
mu0 = (eta0_a/eta0)^(1/alpha);
beta = 0.9;
eps0 = 1/mu0;
convergence = false;
k = 0;
itermax = 1000;
flag = 1;

%Mise en place de la premiere itération
lambdak = lambda0;
xk = x0;
muk = mu0;
epsk = eps0;
etak = eta0;

while (~convergence)
    
%% calcul minimisateur
%Création des handleurs sur le lagrangien augmenté
La = @(x) LagrangienAugmente(x,lambdak,muk,f,c);
gradLa = @(x) GradientLagrangienAugmente(x,lambdak,muk,gradf,c,jc);
hessLa = @(x) HessienneLagrangienAugmente(x,lambdak,muk,hessf,c,jc,hessc);
%Minimisation
delta0 = 2 * (norm(gradf(xk)+jc(xk)*lambdak));
deltamax = 1e8;
tolmin = [ epsk,1e-10];
gamma = [ 0.5 ; 2 ];
eta = [ 0.01 ; 0.7 ];
[xk,krdc,flagrdc] = RegionDeConfianceMS(xk,La,gradLa,hessLa,tolmin,deltamax,delta0,gamma,eta);


%% Test convergence
if ( k > itermax)
        convergence = true;
        flag = 2;
    elseif ((norm(gradf(xk)+jc(xk)*lambdak)) < tol(1)*norm(gradf(x0))) && (norm(c(xk)) < tol(2))
        convergence = true;
        flag = 3;
end

    
    if ((norm(c(xk)) <= etak) && (~convergence))
        %% Mise à jour des multiplicateurs
        lambdak = lambdak + muk*c(xk);
        epsk = epsk/muk;
        etak = etak/(muk^beta);
        k = k + 1;
    
    elseif ((norm(c(xk)) > etak) && (~convergence))
        %% Mise à jour paramétre de pénalité
        muk = t*muk;
        epsk = eps0/muk;
        etak = eta0_a/(muk^alpha);
        k = k + 1;
        
    end
    
    
end
x = xk;
lambda = lambdak;
end
