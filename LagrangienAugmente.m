function y = LagrangienAugmente(x,lambda,mu,f,c)
%% LagrangienAugmente
%Fonction qui renvoie l'image de x par le lagrangien augmenté de f avec les
%contraintes c
%--------------------------------------------------------------------------
% Données :
%  - x : point dont l'image est calculéé
%  - lambda : multiplicateur du lagrangien
%  - mu  : multiplicateur associé à la norme des contrainte
%  - f : fonction dont le lagrangien est calculé
%  - c : fonction des contraintes
% Sortie :  
%  - y : l'image de x
%--------------------------------------------------------------------------
res = (mu/2) * norm(c(x),2)^2;
res = res + f(x);
res = res + lambda'*c(x);
y = res;
end

