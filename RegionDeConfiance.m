function [x,k,flag ] = RegionDeConfiance(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta,choixPas)
%% RegionDeConfiance
%Fonction qui renvoie une approximation du minimum local de la fonction f
%en appliquant l'aglorithme des Regions de confiance avec un pas de Cauchy
%ou un pas de MoreSorensen ( voir données pour plus d'informations)
%--------------------------------------------------------------------------
% Données :
%  - x0 : première approximation de la solution recherchée
%  -  f : fonction à minimiser ( de classe C2)
%  - gradf : gradient de f
%  - hessf : hessienne de f
%  - tol : vecteur de précisions demandées ( dimension 2)
%  - deltamax : rayon maximum de la region de confiance
%  - delta0 : rayon initiale de la region de confiance ( 0 < delta0 < deltamax)
%  - gamma : ordre de modification du rayon de la region de confiance (
%            dimension 2)
%  - eta : seuils de réussite des itérations ( dimension 2)
%  - choixPas : entier vaut 0 pour Pas de Cauchy ou différent de 0 pour MoreSorensen
% Sortie :  
%  - x : une approximation de la solution
%  - k : nombre d'itérations effectuées
%  - flag : entier indiquant la condition d'arrêt vérifiée :
%       1 pour un gradient initialement nul, 2 pour nombre maximum
%       d'itération atteint, 3 pour un minimum atteint, 4 en cas de
%       stagnation de l'algorithme.
%--------------------------------------------------------------------------

%% Initialisation des valeurs
x = x0;
itermax = 10000;
k = 1;
continuer = false;
gr0 = gradf(x0);
gh0 = hessf(x0);
flag = 0;
grk = gr0;
ghk = gh0;
deltak = delta0;

%% Test préliminaire de la norme du gradient en x0
if (norm(gr0)<tol(1))
    continuer = false;
    flag = 1;
else
    continuer = true;
end


%% Application de l'algorithme des Regions de Confiance
while (continuer)
    %% Calcul du pas selon le choix de l'utilisateur
    if (choixPas == 0) 
        [sk,qk] = PasDeCauchy(grk,ghk,deltak);
    else 
        [sk,lambda,qk] = MoreSorensen(grk,ghk,deltak);
    end
    rk = (f(x)-f(x+sk))/-qk;
    
    
    %% Mise à jour de l'itéré
    if rk > eta(1)
        x = x + sk;
    end
    
    grk = gradf(x);
    ghk = hessf(x);
    
    %% Mise à jour de la région de confiance
    if rk >= eta(2)
        deltak = min(gamma(2)*deltak,deltamax);
    elseif (eta(1) <= rk) & (rk < eta(2))
        deltak = deltak;
    else
        deltak = gamma(1)*deltak;
    end
   %% Test de convergence
    if ( k > itermax)
        continuer = false;
        flag = 2;
    elseif (norm(grk)<=tol(1)*norm(gr0))
        continuer = false;
        flag = 3;
    elseif (norm(sk)<=tol(2)*(norm(x)))
        continuer = false;
        flag = 4;
    else
         k = k + 1;
    end
end
   