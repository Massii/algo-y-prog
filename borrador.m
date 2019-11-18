pkg load symbolic

s_vec = [s^2; s; 1];

h_n = [1 0 0];
h_d = [1 3150 1.001*10^7];

h = (h_n*s_vec)/(h_d*s_vec);

ilaplace(h);