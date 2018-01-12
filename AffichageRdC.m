function AffichageRdc(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta)

[x,k,flag] = RegionDeConfiance(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta);
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
end