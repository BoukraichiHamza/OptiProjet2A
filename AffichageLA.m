function AffichageLA(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol)
    %% AffichageLA
%Fonction qui appelle AlgoLagragienAugmente avec les mêmes paramètres et affiche les
%résultats
%--------------------------------------------------------------------------
%Voir AlgoLagrangienAugmente
%--------------------------------------------------------------------------
[x1,flag1,k1,lambda1] = AlgoLagrangienAugmente(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol,0);
disp("-------------------------------------------");
disp("La solution par RegionDeConfiance avec pas de Cauchy est : ");
x1
lambda1
disp(['Le nombre d''itération :  ',int2str(k1)]);
disp("condition d'arrêt :");
if flag1 == 1
    disp("Le gradient est initialment nul");
elseif flag1 == 2
    disp("Nombre d'itération maximum");
elseif flag1 == 3
    disp("Le minimum a été atteint");
end
disp("-------------------------------------------");
[x2,flag2,k2,lambda2] = AlgoLagrangienAugmente(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol,1);
disp("-------------------------------------------");
disp("La solution par RegionDeConfiance avec MoreSorensen est : ");
x2
lambda2
disp(['Le nombre d''itération :  ',int2str(k2)]);
disp("condition d'arrêt :");
if flag2 == 1
    disp("Le gradient est initialment nul");
elseif flag2 == 2
    disp("Nombre d'itération maximum");
elseif flag2 == 3
    disp("Le minimum a été atteint");
end
disp("-------------------------------------------");
[x3,flag3,k3,lambda3] = AlgoLagrangienAugmente(f,gradf,hessf,t,x0,lambda0,c,jc,hessc,tol,2);
disp("-------------------------------------------");
disp("La solution par AlgoNewton est : ");
x3
lambda3
disp(['Le nombre d''itération :  ',int2str(k3)]);
disp("condition d'arrêt :");
if flag3 == 1
    disp("Le gradient est initialment nul");
elseif flag3 == 2
    disp("Nombre d'itération maximum");
elseif flag3 == 3
    disp("Le minimum a été atteint");
end
disp("-------------------------------------------");
end