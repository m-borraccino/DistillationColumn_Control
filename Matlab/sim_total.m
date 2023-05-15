%% init condition

wts_col
close all
mod_col
olp_col
close all

%% controller
% controller='hinf1';
% controller='hinf2';
%  hin_col
% 
% controller='lsh';
% lsh_col
% 
% controller='mu1';
% controller='mu2';
% ms_col
% 
% controller='ltr';
controller='ltr_inf';
% 
% LTR_col

% close all
%% analysis

mu_col
pause
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(1), fullfile(fname, 'rs' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(2), fullfile(fname, 'np' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(3), fullfile(fname, 'rp' ), 'png')
close all

frs_col
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(1), fullfile(fname, 'f1' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(2), fullfile(fname, 'f2' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(3), fullfile(fname, 'f3' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(4), fullfile(fname, 'f4' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(5), fullfile(fname, 'f5' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(6), fullfile(fname, 'f6' ), 'png')
close all

mcs_col
Copy_of_mcs_col
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(1), fullfile(fname, 't1' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(2), fullfile(fname, 't2' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(3), fullfile(fname, 't3' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(4), fullfile(fname, 't4' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(5), fullfile(fname, 't5' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(6), fullfile(fname, 't6' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(7), fullfile(fname, 't7' ), 'png')
fname = strcat('C:\Users\Marco\Desktop\16_3_Borraccino\grafici\',controller);
saveas(figure(8), fullfile(fname, 't8' ), 'png')
close all