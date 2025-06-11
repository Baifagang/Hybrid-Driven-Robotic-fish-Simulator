close all
t = out.tout;
X =  squeeze(out.X);
Y =  squeeze(out.Y);
Z =  squeeze(out.Z);
u = squeeze(out.u);
v = squeeze(out.v);
w = squeeze(out.w);
p = squeeze(out.p);
q = squeeze(out.q);
r = squeeze(out.r);

uHA1 = squeeze(out.uHT1);
uHA2 = squeeze(out.uHT2);
f_uHA3 = squeeze(out.f_uHT3);
theta_uHA3 = squeeze(out.theta_uHT3);
uVA1 = squeeze(out.uVT1);
uVA2 = squeeze(out.uVT2);
uVA3 = squeeze(out.uVT3);


%% 推进器驱动力
tau_surge_HT1andHT2 = squeeze(out.Tau_surge_HT1andHT2);
tau_heave_VT1 = squeeze(out.Tau_heave_VT1);
tau_pitch_VT1 = squeeze(out.Tau_pitch_VT1);
tau_yaw_HT1andHT2 = squeeze(out.Tau_yaw_HT1andHT2);

%% 仿生鳍驱动力
tau_surge_HT3 = squeeze(out.Tau_surge_HT3);
tau_sway_HT3 = squeeze(out.Tau_sway_HT3);
tau_heave_VT2andVT3 = squeeze(out.Tau_heave_VT2andVT3);
tau_roll_VT2andVT3 = squeeze(out.Tau_roll_VT2andVT3);
tau_pitch_VT2andVT3 = squeeze(out.Tau_pitch_VT2andVT3);
tau_yaw_HT3 = squeeze(out.Tau_yaw_HT3);

%% 总的6DOF力
tau_Surge = squeeze(out.Tau_Surge);
tau_Sway = squeeze(out.Tau_Sway);
tau_Heave = squeeze(out.Tau_Heave);
tau_Roll = squeeze(out.Tau_Roll);
tau_Pitch = squeeze(out.Tau_Pitch);
tau_Yaw = squeeze(out.Tau_Yaw);

% 三维位置
figure
plot3(X,Y,Z,'-r','LineWidth',1.5);
axis equal;
hold on;
grid on;
scatter3(X(1),Y(1),Z(1),60,'p','filled','MarkerFaceColor','red');
scatter3(X(end),Y(end),Z(end),60,'h','filled','MarkerFaceColor','black');
% scatter3(TargetPosition(:,1),TargetPosition(:,2),TargetPosition(:,3),100,'o','filled','MarkerFaceColor','green');
scatter3(Waypoints(:,1),Waypoints(:,2),Waypoints(:,3),30,'o','filled','MarkerFaceColor','green');
axis equal;
% legend({'Path','Start','End','Target Position'},'Location','best');
legend({'Path','Start','End','Way-points'},'Location','best');
legend('boxoff');
xlabel('x (m)');ylabel('y (m)');zlabel('z (m)');
set(gca,'ZDir','reverse','FontSize',12);

% 6DOF 速度
figure
subplot(3,2,1)
plot(t,u,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itu')
subplot(3,2,3)
plot(t,v,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itv')
subplot(3,2,5)
plot(t,w,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itw')

subplot(3,2,2)
plot(t,p,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itp')
subplot(3,2,4)
plot(t,q,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itq')
subplot(3,2,6)
plot(t,r,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\itr')

% 6DOF 力和力矩
figure
subplot(3,2,1)
plot(t,tau_Surge,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_S_u_r_g_e')
subplot(3,2,3)
plot(t,tau_Sway,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_S_w_a_y')
subplot(3,2,5)
plot(t,tau_Heave,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_H_e_a_v_e')

subplot(3,2,2)
plot(t,tau_Roll,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_R_o_l_l')
subplot(3,2,4)
plot(t,tau_Pitch,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_P_i_t_c_h')
subplot(3,2,6)
plot(t,tau_Yaw,'-r','LineWidth',1.5);
xlabel('Time');ylabel('\tau_Y_a_w')

% HT1 & HT2 & VT1 力
figure
subplot(2,2,1)
plot(t,tau_surge_HT1andHT2,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_s_u_r_g_e_H_T_1_&_H_T_2 (N)');
subplot(2,2,3)
plot(t,tau_heave_VT1,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_h_e_a_v_e_V_T_1 (N)');
subplot(2,2,2)
plot(t,tau_pitch_VT1,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_p_i_t_c_h_V_T_1 (N)');
subplot(2,2,4)
plot(t,tau_yaw_HT1andHT2,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_y_a_w_H_T_1_&_H_T_2 (Nm)');

% HT3 & VT2 & VT3 力
figure
subplot(3,2,1)
plot(t,tau_surge_HT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_s_u_r_g_e_H_T_3 (N)');
subplot(3,2,3)
plot(t,tau_sway_HT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_s_w_a_y_H_T_3 (N)');
subplot(3,2,5)
plot(t,tau_heave_VT2andVT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_h_e_a_v_e_V_T_2_&_V_T_3 (N)');
subplot(3,2,2)
plot(t,tau_roll_VT2andVT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_r_o_l_l_V_T_2_&_V_T_3 (Nm)');
subplot(3,2,4)
plot(t,tau_pitch_VT2andVT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_p_i_t_c_h_V_T_2_&_V_T_3 (Nm)');
subplot(3,2,6)
plot(t,tau_yaw_HT3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\tau_y_a_w_H_T_3 (Nm)');

% Actuator CMD
figure
subplot(4,2,1)
plot(t,f_uHA3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('f_u_H_A_3 (Hz)');
subplot(4,2,3)
plot(t,theta_uHA3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('\theta_u_H_A_3 (deg)');
subplot(4,2,5)
plot(t,uVA2,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('uVA2 (deg)');
subplot(4,2,7)
plot(t,uVA3,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('uVA3 (deg)');

subplot(4,2,2)
plot(t,uHA1,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('uHA1 (rpm)');
subplot(4,2,4)
plot(t,uHA2,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('uHA2 (rpm)');
subplot(4,2,6)
plot(t,uVA1,'-r','LineWidth',1.5);
xlabel('Time (s)');ylabel('uVA1 (rpm)');
