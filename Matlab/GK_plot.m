% Frequency responses of the Distillation Column
% closed-loop system for random input gains and delays
%
% mod_col
%
% Unscale the plant and controller transfer matrices
Du = diag([1 1]); Si = Du;
De = diag([0.01 0.01]); So = inv(De);
S = blkdiag(So,So);
G_u = inv(So)*G*inv(Si);
if size(K,2) == 2
%  1 dof controller
   K_u = K*So;
elseif size(K,2) == 4
%       2 dof controller        
        K_u = K*S; 
end        
Wn_u = inv(So)*Wn;
%
% Set the parameters values
[k1,k2,Theta1,Theta2] = ndgrid([0.8 1.2],[0.8 1.2],[0 1],[0 1]);
%
figure (4) 
rettax=linspace(0.0010,1000);
rettay=linspace(0,0);
plot(rettax,rettay,'black-','LineWidth',0.1)
hold on
sigma((1/W_Delta),'b-',logspace(-0.1,3,100))
sigma(Wp/(1+W_Delta),logspace(-7,-0.3,100),'b')

for j = 1:16
    [num1,den1] = pade(Theta1(j),2);
    del1 = tf(num1,den1);
    [num2,den2] = pade(Theta2(j),2);
    del2 = tf(num2,den2);
    Del1 = k1(j)*del1;
    Del2 = k2(j)*del2;
    Del = blkdiag(Del1,Del2);
    Gd_u = G_u*Del;
%   
    if size(K,2) == 2    
%      1 dof controller
       systemnames = ' Gd_u K_u Wn_u ';
       inputvar = '[ ref{2}; dist{2}; noise{2} ]';
       outputvar = '[ Gd_u+dist; K_u ]';
       input_to_Gd_u = '[ K_u ]';
       input_to_K_u = '[ ref-Gd_u-dist-Wn_u ]';
       input_to_Wn_u = '[ noise ]';
       clp_ic = sysic;
%    
    elseif size(K,2) == 4
%      2 dof controller   
       systemnames = ' Gd_u K_u Wn_u ';
       inputvar = '[ ref{2}; dist{2}; noise{2} ]';
       outputvar = '[ Gd_u+dist; K_u ]';
       input_to_Gd_u = '[ K_u ]';
       input_to_K_u = '[ -Gd_u-dist-Wn_u; ref ]';
       input_to_Wn_u = '[ noise ]';
       clp_ic = sysic;
    end

%   singular values of G.Ky
    Ky = K_u(1:2,1:2);
    L = Gd_u*Ky;
    omega = logspace(-3,3,100);
    figure(4)
    hold on
    
    sigma(L,'r--',omega)
%     
    sigma(Wp/(1+Del),logspace(-7,-0.3,100),'g')
    delmax = tf([1.2 -7.2 12.4],[1 6 12]);
    sigma((1/delmax),'y-',logspace(-0.1,3,100))


end 

figure(4)
grid on


% sigma((1/W_Delta),'b-',)
sigma(Wp/(1+W_Delta),logspace(-7,-0.3,100),'b')

sigma(L,'r--',omega)
% rettax=linspace(150,150);
% rettay=linspace(-300,300);
% plot(rettax,rettay,'r-')
% rettax=linspace(0.0010,1000);
% rettay=linspace(0,0);
% plot(rettax,rettay,'r-')
% sigma(Wp/(1+W_Delta),'g-')
% sigma(1/(W_Delta),'c')
title('Singular Value Plot of G Ky')
xlabel('Frequency (rad/min)')  

%%
figure
hold on
grid
rettax=linspace(0.0010,1000);
rettay=linspace(0,0);
plot(rettax,rettay,'black-','LineWidth',0.1)
sigma((1/W_Delta),'b-',logspace(-0.1,3,100))
sigma((1/delmax),'b-',logspace(-0.1,3,100))
sigma(L*inv(eye(2,2)+L),omega,'r')

   