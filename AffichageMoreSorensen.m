    function AffichageMoreSorensen(gradf,hessf,delta)
%% AffichageNewton
%Fonction qui appelle AlgoNewton avec les mêmes paramètres et affiche les
%résultats et affiche aussi les résultats de l'etalon fourni
%--------------------------------------------------------------------------
%Voir MoreSorensen
%--------------------------------------------------------------------------
[sM,lambdaM]=MoreSorensen(gradf,hessf,delta);
[sms,dms,lstar,flag] = etalonms(gradf,hessf,delta,1e-10);

disp("-------------------------------------------");
disp("Le pas MoreSorensen est : ");
sM
disp("Le pas de l'etalon est : ");
sms
disp("Lambda par MoreSorensen est : ");
lambdaM
disp("Lambda par etalon est : ");
lstar
disp("-------------------------------------------");
end