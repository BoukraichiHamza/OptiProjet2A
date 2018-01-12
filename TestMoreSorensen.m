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

[s1,lambda1]=MoreSorensen(g1,h1,delta)
[sms1,dms1,lstar1,flag] = etalonms(g1,h1,delta,1e-10)
[s2,lambda2]=MoreSorensen(g2,h2,delta)
[sms2,dms2,lstar2,flag] = etalonms(g2,h2,delta,1e-10)
[s3,lambda3]=MoreSorensen(g3,h3,delta)
[sms3,dms3,lstar3,flag] = etalonms(g3,h3,delta,1e-10)
[s4,lambda4]=MoreSorensen(g4,h4,delta)
[sms4,dms4,lstar4,flag] = etalonms(g4,h4,delta,1e-10)
[s5,lambda5]=MoreSorensen(g5,h5,delta)
[sms5,dms5,lstar5,flag] = etalonms(g5,h5,delta,1e-10)
[s6,lambda6]=MoreSorensen(g6,h6,delta)
[sms6,dms6,lstar6,flag] = etalonms(g6,h6,delta,1e-10)