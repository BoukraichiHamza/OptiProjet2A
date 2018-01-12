function [s,q] = PasDeCauchy(gk,hk,deltak)

normdelta = norm(deltak);
normgk= norm(gk);

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

s = -t*gk;
q = gk'*s + (0.5)*s'*hk*s;
end
