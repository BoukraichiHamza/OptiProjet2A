function y=derivephi(lambda, z, d, delta, inv)
%% derivePhi
% Fonction qui calcule l'image de lambda par la dérivée de la fonction phi
%--------------------------------------------------------------------------
% Données :
%   - lambda : réel
%   - z : vecteur des numérateurs
%   - d : vecteur des denominateurs
%   - delta : réel 
%   - inv : booléen, vaut true si on veut l'expression inverse de phi
%
% Sortie :  
%   - y, image de lambda par phi, point de R^1
%--------------------------------------------------------------------------
phiprime = sum((-2*z.^2)./((lambda+d).^3));

if (inv)
    y = -phiprime/phi(lambda,z,d,delta,false)^2;
else
    y = phiprime;
end

end