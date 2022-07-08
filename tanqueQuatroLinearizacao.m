syms h1 h2 h3 h4 v1 v2 

h10 = 12.4;
h20 = 12.7;
h30 = 1.8;
h40 = 1.4;
v10 = 3;
v20 = 3;

k1 = 3.33;
k2 = 3.35;
gama1 = 0.70;
gama2 = 0.60;

A1 = 28; A3 = 28;
A2 = 32; A4 = 32;

a1 = 0.071; a3 = 0.071;
a2 = 0.057; a4 = 0.057;
kc = 0.50;
g = 981;

f1 = -(a1/A1)*sqrt(2*g*h1)+(a3/A1)*sqrt(2*g*h3)+(gama1*k1/A1)*v1;
f2 = -(a2/A2)*sqrt(2*g*h2)+(a4/A2)*sqrt(2*g*h4)+(gama2*k2/A2)*v2;
f3 = -(a3/A3)*sqrt(2*g*h3)+(1-gama2)*(k2/A3)*v2;
f4 = -(a4/A4)*sqrt(2*g*h4)+(1-gama1)*(k1/A4)*v1;

df1_h1 = diff(f1,h1);
df1_h2 = diff(f1,h2);
df1_h3 = diff(f1,h3);
df1_h4 = diff(f1,h4);
df1_v1 = diff(f1,v1);
df1_v2 = diff(f1,v2);

df2_h1 = diff(f2,h1);
df2_h2 = diff(f2,h2);
df2_h3 = diff(f2,h3);
df2_h4 = diff(f2,h4);
df2_v1 = diff(f2,v1);
df2_v2 = diff(f2,v2);

df3_h1 = diff(f3,h1);
df3_h2 = diff(f3,h2);
df3_h3 = diff(f3,h3);
df3_h4 = diff(f3,h4);
df3_v1 = diff(f3,v1);
df3_v2 = diff(f3,v2);


df4_h1 = diff(f4,h1);
df4_h2 = diff(f4,h2);
df4_h3 = diff(f4,h3);
df4_h4 = diff(f4,h4);
df4_v1 = diff(f4,v1);
df4_v2 = diff(f4,v2);



As = [df1_h1, df1_h2, df1_h3, df1_h4; 
      df2_h1, df2_h2, df2_h3, df2_h4; 
      df3_h1, df3_h2, df3_h3, df3_h4; 
      df4_h1, df4_h2, df4_h3, df4_h4];
  
Bs = [df1_v1, df1_v2;
      df2_v1, df2_v2;
      df3_v1, df3_v2;
      df4_v1, df4_v2];

A = double(subs(As,{h1,h2,h3,h4,v1,v2},{h10,h20,h30,h40,v10,v20}));
B = double(subs(Bs,{h1,h2,h3,h4,v1,v2},{h10,h20,h30,h40,v10,v20}));


C = [1 0 0 0
     0 1 0 0];
D = [0 0
     0 0];

ssTanque = ss(A,B,C,D);