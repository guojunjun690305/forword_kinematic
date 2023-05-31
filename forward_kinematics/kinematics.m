%syms hiproll hipyaw hippitch keen ankle footpitch footroll real
clc
clear
syms th1 th2 th3 th4 th5 th6 th7 th_delt real
syms L1 L2 L3 L4 L5 L6 L7 real
%linkLength = [0, 0, -0.733, 1.396, -1.186, 0.523, 0];
linkLength = [L1, L2, L3, L4, L5, L6, L7];
hip_roll_frame = getRoll(th1, 0, -linkLength(1), 0);
% hip_yaw
hip_yaw_frame = getYaw(th2, linkLength(2), 0, 0);
% hip_pitcht
hip_pitch_frame = getPitch(th3, 0, 0, -linkLength(3));
% knee pitch
knee_pitch_frame = getPitch(th4, 0, 0, -linkLength(4));
% ankle pitch
ankle_pitch_frame = getPitch(th_delt - th4, 0, 0, -linkLength(5));
% foot pitch
foot_pitch_frame = getPitch(th6, 0, 0, -linkLength(6));
% foot roll
foot_roll_frame = getRoll(th7, 0, 0, -linkLength(7));
% foot pos
foot_to_trunk = hip_roll_frame*hip_yaw_frame*hip_pitch_frame*knee_pitch_frame*ankle_pitch_frame*foot_pitch_frame*foot_roll_frame;
%Î»ÖÃ
x_pos = foot_to_trunk(1,4);
y_pos = foot_to_trunk(2,4);
z_pos = foot_to_trunk(3,4);
%×ËÌ¬
pose_R = [foot_to_trunk(1,1),foot_to_trunk(1,2),foot_to_trunk(1,3);
        foot_to_trunk(2,1),foot_to_trunk(2,2),foot_to_trunk(2,3);
        foot_to_trunk(3,1),foot_to_trunk(3,2),foot_to_trunk(3,3)];
%Ðý×ª¾ØÕó×ª»¯ÎªÖá½Ç
%[theta,v] = tr2angvec(pose_R)
% theta = acos((pose_R(1,1)+pose_R(2,2)+pose_R(3,3)-1)/2)
% v = 1/(2*sin(theta))*[pose_R(3,2) - pose_R(2,3);pose_R(1,3) - pose_R(3,1);pose_R(2,1) - pose_R(1,2)]
dx_th1 = simplify(diff(x_pos,th1))
dx_th2 = simplify(diff(x_pos,th2))
dx_th3 = simplify(diff(x_pos,th3))
dx_th4 = simplify(diff(x_pos,th4))
% d_th5 = simplify(diff(x_pos,th5))
dx_th6 = simplify(diff(x_pos,th6))
dx_th7 = simplify(diff(x_pos,th7))

dy_th1 = simplify(diff(y_pos,th1))
dy_th2 = simplify(diff(y_pos,th2))
dy_th3 = simplify(diff(y_pos,th3))
dy_th4 = simplify(diff(y_pos,th4))
% d_th5 = simplify(diff(x_pos,th5))
dy_th6 = simplify(diff(y_pos,th6))
dy_th7 = simplify(diff(y_pos,th7))

dz_th1 = simplify(diff(z_pos,th1))
dz_th2 = simplify(diff(z_pos,th2))
dz_th3 = simplify(diff(z_pos,th3))
dz_th4 = simplify(diff(z_pos,th4))
% d_th5 = simplify(diff(x_pos,th5))
dz_th6 = simplify(diff(z_pos,th6))
dz_th7 = simplify(diff(z_pos,th7))

