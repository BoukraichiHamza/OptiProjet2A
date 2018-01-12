function y = LagrangienAugmente(x,lambda,mu,f,c)

res = (mu/2) * norm(c(x),2)^2;
res = res + f(x);
res = res + lambda'*c(x);
y = res;
end

