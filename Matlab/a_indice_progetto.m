% INDICAZIONI PROGETTO:

% 1) DINAMICA DI MODELLO
%   mod_col
%   necessita di cola_lv

% LV configurazione             cola_lv
% linearizzazione               cola_lin
%           sfrutta             cola_lv_lin

% 2) MODELLO DI INCERTEZZE
% risposta in frequenza di incertezza relativa                        unc_col
% approssimazione delle risposte tramite una f.d.t. di ordine 3       wfit
    
% 3) Weighting functions for Distillation Column system               wts_col
% uncertainty weight, model of f.d.t., performance weight, 
% control action weight,noise shaping filter

%4) Open-loop interconnessioni di sys
%sys con connessioni aperte             olp_col
%contiene open-loop 1 DOG: sys_ic_1dof 
%contiene open-loop 2 DOG: sys_ic_2dof 

%5) Closed-loop interconnessioni di sys
% sys con connessioni chiuse             clp_col
% usa sim_col (open loop system with uncertainties)
% va dato controllore K
%contiene closed-loop 1 e 2 DOG: clp

%6)LTR
%ho provato a farlo ma devo valutarlo               LTR_col.m

%7) Controllore Hinfinito
%Design of 1-DOF and 2-DOF Hinfinito controller        hin_col.m
%PROBLEMA: sintassi sbagliata ho dovuto togliere tol
%si rod stabilità 
%no rob performance

%8) Controllore Hinfinito loop shaping controller
%Design of 1-DOF Hinf loop shaping controller        lsh_col.m
%PROBLEMA: no risultato di libro, no rod stabilità e performance
%NON CAPISCO PERCHE'

%9)Mu-synthesis of the Distillation Column system           ms_col.m





% 10) Valutazione per ogni controllore     mu_col
% per RS RP NP

%11 )Frequency responses of the Distillation Column           frs_col
% closed-loop system for random input gains and delays

%12) Transient responses of the closed_loop Distillation       mcs_col
% Column system for random input gains and delays
