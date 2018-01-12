function y = HessienneLagrangienAugmente(x,lambda,mu,hessf,c,Jc,hessc)
res = hessf(x);
res = res + mu*(Jc(x)*Jc(x)');
z = lambda+mu*c(x);
res = res + hessc(x,z);
y = res;
end