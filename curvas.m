close all
dados_MPC_sem_restricao()
Simulation_Time = 70;
out = sim('modelo_mpc_sem_restricao',Simulation_Time);

figure('Name','Linear - Sem Restrição')
subplot(3,1,1)

plot(y_linear_sr.Time,y_linear_sr.Data,'LineWidth',1)
hold on
plot(referencia_sr.Time,referencia_sr.Data,'--')
grid on
title('Y[(t)]')
xlabel('tempo(s)')
ylabel('Nível(cm)')
legend('h_1','h_2','r_h_1','r_h_2','location','east')


subplot(3,1,2)
plot(du_linear_sr.Time,du_linear_sr.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')

subplot(3,1,3)
plot(u_linear_sr.Time,u_linear_sr.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')
sgtitle('Linear - Sem Restrição')

% -----------------------------------
figure('Name','Não Linear - Sem Restrição')
subplot(3,1,1)

plot(y_nao_linear_sr.Time,y_nao_linear_sr.Data,'LineWidth',1)
hold on
plot(referencia_sr.Time,referencia_sr.Data,'--')
grid on
title('Y[(t)]')
xlabel('tempo(s)')
ylabel('Nível(cm)')
legend('h_1','h_2','r_h_1','r_h_2','location','east')


subplot(3,1,2)
plot(du_nao_linear_sr.Time,du_nao_linear_sr.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')

subplot(3,1,3)
plot(u_nao_linear_sr.Time,u_nao_linear_sr.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')
sgtitle('Não Linear - Sem Restrição')

%% --------------------------------------------------------------
dados_MPC_com_restricao()
Simulation_Time = 30;
out = sim('modelo_mpc_com_restricao',Simulation_Time);

figure('Name','Linear - Com Restrição')
subplot(3,1,1)

plot(y_linear_cr.Time,y_linear_cr.Data,'LineWidth',1)
hold on
plot(referencia_cr.Time,referencia_cr.Data,'--')
grid on
title('Y[(t)]')
xlabel('tempo(s)')
ylabel('Nível(cm)')
legend('h_1','h_2','r_h_1','r_h_2','location','east')


subplot(3,1,2)
plot(du_linear_cr.Time,du_linear_cr.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')

subplot(3,1,3)
plot(u_linear_cr.Time,u_linear_cr.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')
sgtitle('Linear - Com Restrição')

% -----------------------------------
figure('Name','Não Linear - Com Restrição')
subplot(3,1,1)

plot(y_nao_linear_cr.Time,y_nao_linear_cr.Data,'LineWidth',1)
hold on
plot(referencia_cr.Time,referencia_cr.Data,'--')
grid on
title('Y[(t)]')
xlabel('tempo(s)')
ylabel('Nível(cm)')
legend('h_1','h_2','r_h_1','r_h_2','location','east')


subplot(3,1,2)
plot(du_nao_linear_cr.Time,du_nao_linear_cr.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')

subplot(3,1,3)
plot(u_nao_linear_cr.Time,u_nao_linear_cr.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tensão(V)')
legend('Bomba_1','Bomba_2','location','east')
sgtitle('Não Linear - Com Restrição')


%% Saving Figures
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
FolderName = tempdir;
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = get(FigHandle, 'Name');
%   savefig(FigHandle, fullfile(FolderName, FigName, '.fig'));
  saveas(FigHandle,FigName,'png')

end
