function AffichageNewton(x0,tol,gradf,hessf)
%% AffichageNewton
%Fonction qui appelle AlgoNewton avec les mêmes paramètres et affiche les
%résultats
%--------------------------------------------------------------------------
%Voir AlgoNewton
%--------------------------------------------------------------------------
[x,k,flag] = AlgoNewton(x0,tol,gradf,hessf);
disp("-------------------------------------------");
disp("La solution est : ");
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
disp("-------------------------------------------");
end