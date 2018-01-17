%% Script de Test Pour MoreSorensen
g4= [0;0];
g5 = [2;3];
g6 = [2;0];
g1 = [0;0];
g2 = [ 6 ; 2 ];
g3 = [-2 ; 1 ];

h1 = [ 7 0; 0 2];
h2 = [ 7 0 ; 0 2 ];
h3 = [ -2 0 ; 0 20 ];
h4 = [ -2 0 ; 0 10 ];
h5 =[ 4 6 ; 6 5 ];
h6 =[ 4 0 ; 0 -15 ];

delta = 0.5;
AffichageMoreSorensen(g1,h1,delta);
AffichageMoreSorensen(g2,h2,delta);
AffichageMoreSorensen(g3,h3,delta);
AffichageMoreSorensen(g4,h4,delta);
AffichageMoreSorensen(g5,h5,delta);
AffichageMoreSorensen(g6,h6,delta);
