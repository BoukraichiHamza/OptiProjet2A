function [s,q] = PasDeCauchy(gk,hk,deltak)
%% PasDeCauchy
%Fonction qui renvoie le pas de Cauchy
%--------------------------------------------------------------------------
% Données :
%  - gf : gradient de la fonction
%  - hef : hessienne de la fonction
%  - deltak : rayon de la Region de confiance
% Sortie :  
%  - s : pas de Cauchy
%   -q : valeur de la quadratique au pas calculé
%--------------------------------------------------------------------------

%% Calcul des normes
normdelta = norm(deltak);
normgk= norm(gk);

%% Calcul de tau
if normgk < eps
    t = 0;
else
    t = normdelta/normgk;
    denom = gk'*hk*gk;
    temp = normgk^2/denom;
    if temp<t
        t = temp;
    end
end

%% Calcul du pas de Cauchy et de la valeur de la quadratique
s = -t*gk;
q = gk'*s + (0.5)*s'*hk*s;
end
