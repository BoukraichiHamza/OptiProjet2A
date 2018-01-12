g1 = [0;0];
H1 = [ 7 0; 0 2];
g2 = [ 0 ; 0 ];
H2 = [ 7 0 ; 0 2 ];
g2 = [ 6 ; 2 ];
H2 = [ 7 0 ; 0 2 ];
g3 = [-2 ; 1 ];
H3 = [ -2 0 ; 0 20 ];

% s1 = PasDeCauchy(g1,H1,100)
% s1 = PasDeCauchy(g1,H1,50)
% s1 = PasDeCauchy(g1,H1,10)
% s1 = PasDeCauchy(g1,H1,5)
% s1 = PasDeCauchy(g1,H1,0.5)

s2 = PasDeCauchy(g2,H2,500)
s2 = PasDeCauchy(g2,H2,50)
s2 = PasDeCauchy(g2,H2,50)
s2 = PasDeCauchy(g2,H2,0.5)
s2 = PasDeCauchy(g2,H2,0.05)

% s3 = PasDeCauchy(g3,H3,300)
% s3 = PasDeCauchy(g3,H3,30)
% s3 = PasDeCauchy(g3,H3,30)
% s3 = PasDeCauchy(g3,H3,5)
% s3 = PasDeCauchy(g3,H3,0.5)

