function [du1,du2]  = MPC_com_restricao(entrada)
global var
[N,Nu,Bp,Cp,Qp,Rp,Ap,Ya,Yb,Ua,Ub,M,Dua,Dub] = deal(var.N,var.Nu,var.Bp,var.Cp,var.Qp,var.Rp,var.Ap,var.Ya,var.Yb,var.Ua,var.Ub,var.M,var.Dua,var.Dub)

up = entrada(1:2);
w = entrada(3:4);
Xk = entrada(5:end);zz


W = repmat(w,N,1);
H = 2*(Bp'*Cp'*Qp*Cp*Bp + Rp);
f = 2*(Qp*Cp*Bp)'*(Cp*Ap*Xk - W)

Um = repmat(up,Nu,1);


Ra = [Ya*Cp*Bp;Ua*M;Dua];
Rb = [Yb-Ya*Cp*Ap*Xk;Ub-Ua*Um;Dub];

[du, fval,flag] = quadprog(H,f,Ra,Rb);

du1 = du(1)
du2 = du(2)
end

