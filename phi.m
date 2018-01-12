function y=phi(lambda, z, d, delta, inv)
%--------------------------------------------------------------------------
% Données :
%   - lambda, réel
%   - z, vecteur de taille n, les numérateurs
%   - d, vecteur de taille n, les dénominateurs
%   - delta, réel
%   - inv, booléen, vaut true si on veut l'expression inverse de phi
%
% Sortie :  
%   - y, image de lambda par phi, point de R^1
%--------------------------------------------------------------------------

norme_s_lambda_carre = sum((z.^2)./((lambda+d).^2));

if (inv)
    y = (1/norme_s_lambda_carre) - 1/(delta)^2;
else
    y = norme_s_lambda_carre-(delta)^2;
end

end