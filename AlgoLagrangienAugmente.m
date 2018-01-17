function [x,flag,k,lambda] = AlgoLagrangienAugmente(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol,choixMethode)

%% AlgoLagrangienAugmente
% Fonction qui retourne la solution d'un probleme de minimisation avec
% contraintes d'égalités en appliquant l'algorithme du lagrangien Augmenté
%--------------------------------------------------------------------------
% Données :
%  - f : fonction à minimiser
%  - gradf : gradient de f
%  - hessf : hessienne de f
%  - t : coefficient de modification des multiplicateurs
%  - x0 : première approximation de la solution recherchée
%  - lambda0 : multiplicateur de départ pour les contraintes
%  - c : fonction des contraintes
%  - jc : la jacobienne transposée de c
%  - hessc : fonction de calcul des combinaisons linéaires des hessiennes
%       de C
%  - tol : vecteur de précisions demandées ( dimension 2)
%  - choixMethode : entier indiquant quelle methode utiliser pour resoudre
%                   le probleme de minimisation auxiliaire
%                   - 0 pour RegionDeConfiance avec Pas de Cauchy
%                   - 1 pour RegionDeConfiance avec MoreSorensen
%                   - autre pour AlgoNewton       
% Sortie :  
%  - x : une approximation de la solution
%  - flag : entier indiquant la condition d'arrêt vérifiée :
%       1 pour un gradient initialement nul, 2 pour nombre maximum
%       d'itération atteint, 3 pour un minimum atteint.
%  - k : nombre d'itérations effectuées
% - lambda : multiplicateur final des contraintes

%--------------------------------------------------------------------------

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
normG0 = norm(gradf(x0));

while (~convergence)
    
%% calcul minimisateur

%% Création des handleurs sur le lagrangien augmenté
La = @(x) LagrangienAugmente(x,lambdak,muk,f,c);
gradLa = @(x) GradientLagrangienAugmente(x,lambdak,muk,gradf,c,jc);
hessLa = @(x) HessienneLagrangienAugmente(x,lambdak,muk,hessf,c,jc,hessc);
%% Minimisation
delta0 = 2 * (norm(gradf(xk)+jc(xk)*lambdak));
deltamax = 1e8;
tolmin = [ epsk,1e-10];
gamma = [ 0.5 ; 2 ];
eta = [ 0.01 ; 0.7 ];
if (choixMethode == 0)
    [xk,~] = RegionDeConfiance(xk,La,gradLa,hessLa,tolmin,deltamax,delta0,gamma,eta,0);
elseif (choixMethode == 1)
     [xk,~] = RegionDeConfiance(xk,La,gradLa,hessLa,tolmin,deltamax,delta0,gamma,eta,1);
else
    [xk,~] = AlgoNewton(xk,tolmin,gradLa,hessLa);
end
    


%% Test convergence
normGk = norm(gradf(xk)+jc(xk)*lambdak);


if ( k > itermax)
        convergence = true;
        flag = 2;
    elseif  (normGk < tol(1)*normG0) 
        if (norm(c(xk)) < tol(2))
            convergence = true;
            flag = 3;
        end
        
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
%% Récupération des valeurs de sortie
x = xk;
lambda = lambdak;
end
