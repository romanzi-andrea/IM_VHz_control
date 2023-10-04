clear all
close all
clc
%%
f  = 50;
Rs   = 0.24; 
Ls   = 59.4e-3;
Lr   = 59.1e-3;
Lm   = 57e-3;
Rr   = 0.175;
np   = 3;
n    = 6;
vsat = 380;
Lks = Ls- Lm^2/Lr;

% compressor param 
I   = 0.4;
B   = 0.068;  % Stima
k = 0.009;
r = 4;

Yrd_n = 1.9373;
Ys_n = 2.088;
wb = 170;  %exp
K = 1:500;
for w=1:500
    if w<=wb
        K(w) = Ys_n;
    else
        K(w) = Ys_n/(w-wb);
    end
end

%% regulators
s = tf('s');
Gw = 1/(B+I*s);
wc_des = 1000;
Rw = wc_des*(B+I*s)/s;
kpw = 4*100;
kiw = 0.68*100;