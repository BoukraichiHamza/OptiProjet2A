function y=derivephi(lambda, z, d, delta, inv)
%--------------------------------------------------------------------------
% Données :
%   - lambda, réel
%   - n1, réel, numérateur n°1
%   - n2, réel, numérateur n°2
%   - d1, réel, dénominateur n°1
%   - d2, réel, dénominateur n°2
%   - delta, réel
%   - inv, booléen, vaut true si on veut l'expression inverse de phi
%
% Sortie :  
%   - y, image de lambda par phi, point de R^1
phiprime = sum((-2*z.^2)./((lambda+d).^3));

if (inv)
    y = -phiprime/phi(lambda,z,d,delta,false)^2;
else
    y = phiprime;
end

end