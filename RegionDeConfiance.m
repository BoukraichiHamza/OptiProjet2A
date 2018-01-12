function [x,k,flag ] = RegionDeConfianceMS(x0,f,gradf,hessf,tol,deltamax,delta0,gamma,eta)

%fonction qui renvoie une solution du probleme min f%
x = x0;
itermax = 10000;
k = 1;
continuer = false;
gr0 = gradf(x0);
gh0 = hessf(x0);
flag = 0;

if (norm(gr0)<tol(1))
    continuer = false;
    flag = 1;
else
    continuer = true;
end

grk = gr0;
ghk = gh0;
deltak = delta0;

while (continuer)
    
    [sk,qk] = PasDeCauchy(grk,ghk,deltak);
    rk = (f(x)-f(x+sk))/-qk;
    
    
    %Mise à jour de l'itéré
    if rk > eta(1)
        x = x + sk;
    end
    
    grk = gradf(x);
    ghk = hessf(x);
    
    %Mise à jour de la région de confiance
    if rk >= eta(2)
        deltak = min(gamma(2)*deltak,deltamax);
    elseif (eta(1) <= rk) & (rk < eta(2))
        deltak = deltak;
    else
        deltak = gamma(1)*deltak;
    end
   %Test des cas de sortie
    if ( k > itermax)
        continuer = false;
        flag = 2;
    elseif (norm(grk)<=tol(1)*norm(gr0))
        continuer = false;
        flag = 3;
    elseif (norm(sk)<=tol(2)*(norm(x)))
        continuer = false;
        flag = 4;
    else
         k = k + 1;
    end
end
   