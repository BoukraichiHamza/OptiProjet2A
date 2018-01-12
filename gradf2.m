function y = gradf2(x)
global ngev
y = [-400*x(1)*(x(2)-x(1)^2) - 2*(1-x(1)); 200 * (x(2)-x(1)^2) ];
ngev = ngev + 1;
end