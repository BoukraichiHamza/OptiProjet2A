function lambda = NewtonNonLineaire(phi,dphi,lambda0,tol)
 %% NewtonNonLineaire
%Fonction qui renvoie une approximation du zero de la fonction phi
%en appliquant l'aglorithme de Newton non lineaire
%--------------------------------------------------------------------------
% Données :
%  - phi : la fonction à annuler
%  - tol : précision demandée 
%  - lambda0 : vecteur des points de départ (lambda0(1) = lambdamin et
%               lambda0(2) = lambdamax
%  - dphi : fonction dérivée de phi
% Sortie :  
%  - lambda : une approximation du zero de la fonction phi
% Précondition :
% - 
%--------------------------------------------------------------------------
%% Initialisation de la valeur de lambda
lambdamin = lambda0(1);
lambdamax = lambda0(2);

%% Vérification des préconditions de NNL
if phi(lambdamin)*phi(lambdamax) > 0
    error('Condition non vérifiées NewtonNonLineaire');
end

%% Test préliminaire dans le cas où le zero est déjà atteint
if min(abs(phi(lambdamin)),abs(phi(lambdamax))) >= tol
    lambda = lambdamax;
else
    if abs(phi(lambdamin)) < abs(phi(lambdamax))
        lambda = lambdamin;
    else
        lambda = lambdamax;
    end
end

%% Itération de Newton
while(abs(phi(lambda)) > tol)
    lambdan = lambda - phi(lambda)/dphi(lambda);
    
    if lambdan <= max(lambdamax,lambdamin) & lambdan >= min(lambdamin,lambdamax) & abs(phi(lambdan))<0.5*abs(phi(lambda)) 
        % Cas itéré accepté
        lambda = lambdan;
    else
        % Cas dichotomie
        lambdad = (lambdamin+lambdamax)/2;
        if phi(lambdamin)*phi(lambdad) <= 0
            lambdamax = lambdad;
        else
            lambdamin = lambdad;
        end
        
        lambda = lambdad;
    end
end