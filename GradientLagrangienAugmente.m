function y = GradientLagrangienAugmente(x,lambda, mu, gradf, c,Jc)
res = gradf(x);
res = res + (Jc(x))*(mu*c(x)+lambda);
y = res;
end