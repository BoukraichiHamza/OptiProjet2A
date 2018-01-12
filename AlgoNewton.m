function [x,k,flag] = AlgoNewton(f,x0,tol,gradf,hessf)

%fonction qui renvoie une solution du probleme min f%
x = x0;
itermax = 100;
k = 1;
continuer = false;
gr0 = gradf(x0);
gf0 = hessf(x0);
flag = 0;

if (norm(gr0)<tol(1))
    continuer = false;
    flag = 1;
else
    continuer = true;
end

grk = gr0;
gfk = gf0;

while (continuer)
    d = -gfk\grk;
    x = x + d;
    grk = gradf(x);
    gfk = hessf(x);
   
    if ( k > itermax)
        continuer = false;
        flag = 2;
    elseif (norm(grk)<=tol(1)*norm(gr0))
        continuer = false;
        flag = 3;
    elseif (norm(d)<=tol(2)*(norm(x)+1e-8))
        continuer = false;
        flag = 4;
    else
         k = k + 1;
    end
   
end