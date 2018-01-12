function lambda = NewtonNonLineaire(phi,dphi,lambda0,tol)
    
%Initialisation de la valeur de lambda
lambdamin = lambda0(1);
lambdamax = lambda0(2);

if phi(lambdamin)*phi(lambdamax) > 0
    error('Condition non vérifiées NewtonNonLineaire');
end

if min(abs(phi(lambdamin)),abs(phi(lambdamax))) >= tol
    lambda = lambdamax;
else
    if abs(phi(lambdamin)) < abs(phi(lambdamax))
        lambda = lambdamin
    else
        lambda = lambdamax
    end
end

while(abs(phi(lambda)) > tol)
    lambdan = lambda - phi(lambda)/dphi(lambda);
    
    if lambdan <= max(lambdamax,lambdamin) & lambdan >= min(lambdamin,lambdamax) & abs(phi(lambdan))<0.5*abs(phi(lambda))    
        lambda = lambdan;
    else
        lambdad = (lambdamin+lambdamax)/2;
        if phi(lambdamin)*phi(lambdad) <= 0
            lambdamax = lambdad;
        else
            lambdamin = lambdamin;
        end
        
        lambda = lambdad;
    end
end