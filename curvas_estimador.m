close all
dados_MPC_sem_restricao_estimador()
Simulation_Time = 70;
out = sim('modelo_mpc_sem_restricao_estimador',Simulation_Time);

Simulation_Time = 70;
out = sim('modelo_mpc_sem_restricao',Simulation_Time);
figure('Name','Mensur·veis x Com Estimador - Linear - Sem RestriÁ„o')
% ----------------------------------
subplot(3,1,1)

plot(y_linear_sr.Time,y_linear_sr.Data,'--','LineWidth',1)
hold on
grid on
plot(y_linear_sr_estimador.Time,y_linear_sr_estimador.Data,'LineWidth',1)

title('Y[(t)]')
xlabel('tempo(s)')
ylabel('NÌvel(cm)')
legend('h_1','h_2','Íh_1','Íh_2','location','east')


subplot(3,1,2)
plot(du_linear_sr.Time,du_linear_sr.Data,'--','LineWidth',1)
hold on
plot(du_linear_sr_estimador.Time,du_linear_sr_estimador.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')

subplot(3,1,3)
plot(u_linear_sr.Time,u_linear_sr.Data,'--','LineWidth',1)
hold on 
plot(u_linear_sr_estimador.Time,u_linear_sr_estimador.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')
sgtitle('Mensur·veis x Com Estimador - Linear - Sem RestriÁ„o')
% -----------------------------------
figure('Name','Mensur·veis x Com Estimador - N„o Linear - Sem RestriÁ„o')
 
subplot(3,1,1)

plot(y_nao_linear_sr.Time,y_nao_linear_sr.Data,'--','LineWidth',1)
hold on
grid on
plot(y_nao_linear_sr_estimador.Time,y_nao_linear_sr_estimador.Data,'LineWidth',1)

title('Y[(t)]')
xlabel('tempo(s)')
ylabel('NÌvel(cm)')
legend('h_1','h_2','Íh_1','Íh_2','location','east')


subplot(3,1,2)
plot(du_nao_linear_sr.Time,du_nao_linear_sr.Data,'--','LineWidth',1)
hold on
plot(du_nao_linear_sr_estimador.Time,du_nao_linear_sr_estimador.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')

subplot(3,1,3)
plot(u_nao_linear_sr.Time,u_nao_linear_sr.Data,'--','LineWidth',1)
hold on 
plot(u_nao_linear_sr_estimador.Time,u_nao_linear_sr_estimador.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')
sgtitle('Mensur·veis x Com Estimador - N„o Linear - Sem RestriÁ„o')

%% =====================================================================

dados_MPC_com_restricao_estimador()
Simulation_Time = 30;
out = sim('modelo_mpc_com_restricao_estimador',Simulation_Time);

Simulation_Time = 30;
out = sim('modelo_mpc_com_restricao',Simulation_Time);
figure('Name','Mensur·veis x Com Estimador - Linear - com RestriÁ„o')
% ----------------------------------
subplot(3,1,1)

plot(y_linear_cr.Time,y_linear_cr.Data,'--','LineWidth',1)
hold on
grid on
plot(y_linear_cr_estimador.Time,y_linear_cr_estimador.Data,'LineWidth',1)

title('Y[(t)]')
xlabel('tempo(s)')
ylabel('NÌvel(cm)')
legend('h_1','h_2','Íh_1','Íh_2','location','east')


subplot(3,1,2)
plot(du_linear_cr.Time,du_linear_cr.Data,'--','LineWidth',1)
hold on
plot(du_linear_cr_estimador.Time,du_linear_cr_estimador.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')

subplot(3,1,3)
plot(u_linear_cr.Time,u_linear_cr.Data,'--','LineWidth',1)
hold on 
plot(u_linear_cr_estimador.Time,u_linear_cr_estimador.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')
sgtitle('Mensur·veis x Com Estimador - Linear - Sem RestriÁ„o')
% -----------------------------------
figure('Name','Mensur·veis x Com Estimador - N„o Linear - Com RestriÁ„o')
 
subplot(3,1,1)

plot(y_nao_linear_cr.Time,y_nao_linear_cr.Data,'--','LineWidth',1)
hold on
grid on
plot(y_nao_linear_cr_estimador.Time,y_nao_linear_cr_estimador.Data,'LineWidth',1)

title('Y[(t)]')
xlabel('tempo(s)')
ylabel('NÌvel(cm)')
legend('h_1','h_2','Íh_1','Íh_2','location','east')


subplot(3,1,2)
plot(du_nao_linear_cr.Time,du_nao_linear_cr.Data,'--','LineWidth',1)
hold on
plot(du_nao_linear_cr_estimador.Time,du_nao_linear_cr_estimador.Data,'LineWidth',1)
grid on
title('dU[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')

subplot(3,1,3)
plot(u_nao_linear_cr.Time,u_nao_linear_cr.Data,'--','LineWidth',1)
hold on 
plot(u_nao_linear_cr_estimador.Time,u_nao_linear_cr_estimador.Data,'LineWidth',1)
grid on
title('U[(t)]')
xlabel('tempo(s)')
ylabel('Tens„o(V)')
legend('Bomba_1','Bomba_2','ÍBomba_1','ÍBomba_2','location','east')
sgtitle('Mensur·veis x Com Estimador - N„o Linear - Com RestriÁ„o')


%% Saving Figures
FigList = findobj(allchild(0), 'flat', 'Type', 'figure');
FolderName = tempdir;
for iFig = 1:length(FigList)
  FigHandle = FigList(iFig);
  FigName   = get(FigHandle, 'Name');
%   savefig(FigHandle, fullfile(FolderName, FigName, '.fig'));
  saveas(FigHandle,FigName,'png')

end
