%  CONTROLLORE LTR
run mod_col.m;
%tolgo le certezze struttrate del sistema
% G è il sistema nominale ridotto di ordine 6
w = logspace(-7,3,100);
Gp=G;
%aumento il sistema inserendo un banco di integratori
gg1=tf(1,[1 0.00001]);
GG1=blkdiag(gg1,gg1);
G=GG1*G;

%ricalcolo le interconnessioni del sistema
% open-loop connection with the weighting functions
% 1 dof controller
systemnames = ' G Delta W_Delta Wm Wn Wp Wu ';
inputvar = '[ ref{2}; noise{2}; control{2} ]';
outputvar = '[ Wp; Wu; ref-G-Wn ]';
input_to_G = '[ control+Delta ]';
input_to_Delta = '[ W_Delta ]';
input_to_W_Delta = '[ control ]';
input_to_Wm =  '[ ref ]';
input_to_Wn = '[ noise ]';
input_to_Wp = '[ G-Wm ]';
input_to_Wu = '[ control ]';
sys_ic_1dof = sysic;
%il sistema adesso sarà di grado 8, lo lascio così

[A,B,C,D] = ssdata(G);
[Ap,Bp,Cp,Dp] = ssdata(Gp);

%scelgo questi parametri H e r per l'LQR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
H = C;
r=1;

% H = C+[10 -10 0 0 0 0 0 0;-10 2 0 0 0 0 0 0]
% r=300;

% H1 = inv(Bp'*Bp)*Bp';
% H2 = -inv(Cp*inv(Ap)*Bp);
% H = 20*[H2,H1];
% r=300;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%scelta di H e r per rispettare i re quisiti in bassa frequenza per la
%procedura ltr
figure (1)
hold on
grid on
L1=ss(A,B,H,0);
sigma(L1/sqrt(300),'b-',w)
% L1=tf(H)*inv(tf('s')*tf(eye(8,8))-tf(A))*tf(B);
% sv_L1=sigma(L1,w);
% sv_L1=sv_L1/(sqrt(r));
% sys = frd(sv_L1(1,:),w);
% sigma(sys,w,'r--')
% sys = frd(sv_L1(2,:),w);
% sigma(sys,w,'r--')

sigma(Wp/(1+W_Delta),'g-')
% sigma(1/(W_Delta),'c')
legend('sv(HphiB)','sv_bound mod-inc') 
xlabel('Frequency (rad/min)')
grid on

svd(H*B/sqrt(r))

%sintesi dell'LQR
Q=H'*H;
R=r*eye(size(B,2));   %matrice identità con dim = numero colonne di B
F = lqr(G,Q,R,0);
%%
%confronto tra le due tf post lqr per 
figure (2)
hold on
grid on
sigma(Wp/(1+W_Delta),logspace(-7,-0.3,100),'g')
sigma(1/(W_Delta),logspace(-0.1,3,100),'c')
L=ss(A,B,F,0);
sigma(L,w,'r')
% L=ss(A,B,H,0);
% sigma(L,w,'b')
legend('sv_bound mod-inc','sv_bound inc','TF input o-l','TF-H appross')
grid on
xlabel('Frequency (rad/min)')

%% recupero LTR
figure (2)
hold on
grid on
sigma(Wp/(1+W_Delta),logspace(-7,-0.3,100),'g')
sigma(1/(W_Delta),logspace(-0.1,3,100),'c')
L=ss(A,B,F,0);
% sigma(L,w,'r--')
% L=ss(A,B,H,0);
% sigma(L,w,'b')
% legend('sv_bound mod-inc','sv_bound inc','TF input o-l','TF-H appross')
grid on
xlabel('Frequency (rad/min)')

% H=C+[7 -10 0 0 0 0 0 0;-10 2 0 0 00 0 0];
% XI=Q;
H=C;
XI=H'*H;
mu=1;
THETA=mu*eye(size(C,1));
   
%la robusta stabilità è tada adll'LQR, quindi quella c'è, la performance
%robusta invece no. Non viene garantita nemmeno grazie al filtro di kalman
%in recupero LTR perché il sistema è a fase non minima.
% si vede che per valori anche alti la RS si mantiene ma peggiora sempre di
% più la RP perché all'oo il recupero viene sbagliato e a frequenze
% maggiori si perde tale specifica

%con un guadagno più piccolo invece la RS è sempre mantenuta, migliora la
%performance robusta (RHO=0.01)

RHO=[0.1  ]; 
% RHO=[ 10 100 1e5 1e8 1e15 ];

figure (2)
hold on 
grid on
% sigma(G,w,'r--')
L=ss(A,B,F,0);
% sigma(1/(W_Delta),logspace(-0.1,3,100),'c')

 sigma(L,w,'r--')
[K,SVL,W1]=ltrsyn(G,F,XI,THETA,RHO,w);

hold on 
grid on
% sigma(K*G,w,'r--')
 sigma(L,w,'r--')
xlabel('Frequency (rad/min)')
 pause

% figure (1)
% close
% figure (2)
% close

run mu_col.m;
                                               