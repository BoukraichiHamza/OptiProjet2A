function y = GradientLagrangienAugmente(x,lambda, mu, gradf, c,Jc)
%% GradientLagrangienAugmente
%Fonction qui renvoie l'image de x par le gradient du 
%lagrangien augmenté de f avec les contraintes c
%--------------------------------------------------------------------------
% Données :
%  - x : point dont l'image est calculéé
%  - lambda : multiplicateur du lagrangien
%  - mu  : multiplicateur associé à la norme des contrainte
%  - gradf : gradient de la fonction dont le lagrangien est calculé
%  - Jc : jacobienne transposée de la fonction des contraintes
% Sortie :  
%  - y : l'image de x
%--------------------------------------------------------------------------
res = gradf(x);
res = res + (Jc(x))*(mu*c(x)+lambda);
y = res;
end