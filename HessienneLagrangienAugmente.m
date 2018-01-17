function y = HessienneLagrangienAugmente(x,lambda,mu,hessf,c,Jc,hessc)
%% HessienneLagrangienAugmente
%Fonction qui renvoie l'image de x par le lagrangien augmenté de f avec les
%contraintes c
%--------------------------------------------------------------------------
% Données :
%  - x : point dont l'image est calculéé
%  - lambda : multiplicateur du lagrangien
%  - mu  : multiplicateur associé à la norme des contrainte
%  - hessf : hessienne de la fonction dont le lagrangien est calculé
%  - c : fonction des contraintes
%  - Jc : jacobienne transposée de c
%  - hessc : fonction de calcul de combinaisons linéaires des hessiennes
%           des contraintes
% Sortie :  
%  - y : l'image de x
%--------------------------------------------------------------------------
res = hessf(x);
res = res + mu*(Jc(x)*Jc(x)');
z = lambda+mu*c(x);
res = res + hessc(x,z);
y = res;
end