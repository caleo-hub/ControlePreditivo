clear,clc
dadosTanqueQuatro();

N = 100;
Nu = 25;
h= 0.1;
rho = 1;

sysd = c2d(ss(A,B,C,D),h,'zoh');
Ad = sysd.A;
Bd = sysd.B;
Cd = sysd.C;
Dd = sysd.D;


%% Sistema expandido
[m,n] = size(Ad);
[n_saidas,q] = size(Cd);
[rr,n_entradas] = size(Bd);

Aa = [Ad, zeros(m,n_saidas); Cd*Ad, eye(n_saidas)];
Ba = [Bd;Cd*Bd];
Ca = [zeros(n_saidas,m) eye(n_saidas)];
Da = Dd;

Qy =  eye(n_saidas);
Ru = rho*eye(n_entradas);

Ap = [];
Bp = [];
Qp = [];
Rp = [];
Cp = [];
Wr = [];

%% Matrizes baseadas em N
% Construção matrizes caligráficas A, Q, C e W
for linha=1:N
    Ap = [Ap; Aa^linha];
    Qp =blkdiag(Qp,Qy);
    Cp =blkdiag(Cp,Ca);
    Wr = [Wr; eye(n_entradas)];
end


%% Matrizes baseadas em Nu
% Construção das matrizes Caligráficas R
for i=1:Nu
    Rp = blkdiag(Rp,Ru);
end

% Construção das matrizes Caligráficas B
for linha=1:N
    aux = [];
    for coluna=1:Nu
        
        
        
        if coluna<=linha
            aux = [aux Aa^(linha-coluna)*Ba];
        else
            aux = [aux zeros(size(Aa*Ba))];
        end
        
    end
    Bp = [Bp;aux];
end    

%% Ganho fixo do Model Predictive Control (mpc)
Kmpc = inv(Bp'*Cp'*Qp*Cp*Bp + Rp)*Bp'*Cp'*Qp';
Kmpc = Kmpc(1:n_entradas,:); % Obtendo somente os n_entradas primeiros ganhos para entrada do sistema
Rl = Cp*Ap;


%% Restrições Definição
M = [];
for linha = 1:Nu
    aux = [];
    for coluna = 1:Nu
        if coluna<=linha
            aux = [aux eye(n_entradas)];
        else
            aux = [aux zeros(n_entradas)];
        end
    end 
    M = [M;aux];    
end


ymax = 10;
ymin = 10;

u1max = 4;
u1min = 1;
u2max = 4;
u2min = 1;

du1max = 10;
du2max = 10;
du1min = 10;
du2min = 10;

ya=[1 0;-1 0;0 1;0 -1];yb=[ymax; ymin;ymax; ymin];
ua=[1 0;-1 0;0 1;0 -1];ub=[u1max;u1min;u2max;u2min];
dua=[1 0;-1 0;0 1;0 -1];dub=[du1max;du1min;du2max;du2min];

Ya = [];
Yb = [];
for linha=1:N
    Ya = blkdiag(Ya,ya);
    Yb = [Yb;yb];
    
    
end


Dua = [];
Ua = [];
Ub = [];
Dub = [];
for i=1:Nu
    Dua = blkdiag(Dua,dua);
    Ua = blkdiag(Ua,ua);
    Ub = [Ub;ub];
    Dub = [Dub;dub];
    
end

var.N = N;
var.Nu = Nu;
var.Bp = Bp;
var.Cp=Cp;
var.Qp = Qp;
var.Rp = Rp;
var.Ap = Ap;
var.Ya = Ya;
var.Yb = Yb;
var.Ua = Ua;
var.Ub = Ub;
var.M = M;
var.Dua = Dua;
var.Dub = Dub;

var_bus_info = Simulink.Bus.createObject(var);
var_bus = evalin('base', var_bus_info.busName);
