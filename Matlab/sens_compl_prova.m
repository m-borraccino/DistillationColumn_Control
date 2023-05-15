
figure
hold on
grid on
sigma(1/(W_Delta),logspace(-0.1,3,100),'c')
sigma(L*inv(eye(2,2)+L),w,'r')

sigma(L*inv(eye(2,2)+L),w,'r')
