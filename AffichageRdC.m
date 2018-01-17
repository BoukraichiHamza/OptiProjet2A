function AffichageRdc(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta,choixPas)
%% AffichageRdc
%Fonction qui appelle RegionDeConfiance avec les mêmes paramètres et affiche les
%résultats
%--------------------------------------------------------------------------
%Voir RegionDeConfiance
%--------------------------------------------------------------------------
[x,k,flag] = RegionDeConfiance(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta,choixPas);
disp("---------------------------------------------");
if (choixPas == 0)
    disp("La solution par pas de Cauchy est : ");
else
    disp("La solution par MoreSorensen est : ");
end
x
disp(['Le nombre d''itération :  ',int2str(k)]);
disp("condition d'arrêt :");
if flag == 1
    disp("Le gradient est initialment nul");
elseif flag == 2
    disp("Nombre d'itération maximum");
elseif flag == 3
    disp("Le minimum a été atteint");
elseif flag == 4
    disp("L'algorithme stagne");
end
disp("---------------------------------------------");
end