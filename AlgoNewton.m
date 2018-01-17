function [x,k,flag] = AlgoNewton(x0,tol,gradf,hessf)

%% AlgoNewton
%Fonction qui renvoie une approximation du minimum local de la fonction f
%en appliquant l'aglorithme de newton
%--------------------------------------------------------------------------
% Données :
%  - x0 : première approximation de la solution recherchée
%  - tol : vecteur de précisions demandées ( dimension 2)
%  - gradf : gradient de f
%  - hessf : hessienne de f
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
itermax = 100;
k = 1;
continuer = false;
gr0 = gradf(x0);
gf0 = hessf(x0);
flag = 0;
grk = gr0;
gfk = gf0;

%% Test préliminaire de la norme du gradient en x0
if (norm(gr0)<tol(1))
    continuer = false;
    flag = 1;
else
    continuer = true;
end


%% Application de l'algorithme de Newton
while (continuer)
    %Calcul de la solution du systeme et mise à jour des variables
    d = -gfk\grk;
    x = x + d;
    grk = gradf(x);
    gfk = hessf(x);
   
    %Test de la convergence
    if ( k > itermax)
        continuer = false;
        flag = 2;
    elseif (norm(grk)<=tol(1)*norm(gr0))
        continuer = false;
        flag = 3;
    elseif (norm(d)<=tol(2)*(norm(x)+1e-8))
        continuer = false;
        flag = 4;
    else
         k = k + 1;
    end
end