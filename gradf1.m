function y = gradf1(x)
global ngev
y = [ 4*(x(1)+x(2)+x(3)-3) + (2*(x(1)-x(2))) ; 
    4*(x(1)+x(2)+x(3)-3) - 2*(x(1)-x(2)) + 2*(x(2)-x(3)) ;
    4*(x(1)+x(2)+x(3)-3) - 2*(x(2)-x(3)) ];
ngev = ngev + 1;
end