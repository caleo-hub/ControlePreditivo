A1=28;A2=32;A3=28;A4=32;
a1=0.071;a2=0.057;a3=0.071;a4=0.057;
kc=0.5;g=981;

%%Para P-
h1=12.4;h2=12.7;h3=1.8;h4=1.4;
v1=3;v2=3;
k1=3.33;k2=3.35;
y1=0.7;y2=0.6;


T1=(A1/a1)*sqrt(2*h1/g);
T2=(A2/a2)*sqrt(2*h2/g);
T3=(A3/a3)*sqrt(2*h3/g);
T4=(A4/a4)*sqrt(2*h4/g);

A = [-1/T1 0 A3/(A1*T3) 0
     0 -1/T2 0 A4/(A2*T4)
     0 0 -1/T3 0
     0 0 0 -1/T4];
B = [(y1*k1)/A1 0
     0 (y2*k2)/A2
     0 ((1-y2)*k2)/A3
     ((1-y1)*k1)/A4 0];
C = [1 0 0 0
     0 1 0 0];
D = [0 0
     0 0];
SS=ss(A,B,C,D);

