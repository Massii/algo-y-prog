pkg load symbolic
pkg load control
pkg load specfun


s = tf('s');

s_vec = [s^2; s; 1];

h_n = [1 0 0];
h_d = [1 3150 1.004*10^7];

h = (h_n*s_vec)/(h_d*s_vec);

syms q t
F = -q^2/(q^2 + 3150*q + 1.004*10^7);
y = ilaplace(F, q, t);

%Calculo con Wolfram, Matlab y "manualmente" la antitransformada de H
%H = -s^2/(s^2 + 3150*s + 1.004*10^7)
%Obtengo la misma respuesta con Wolfram que  manualmente
%
%Wolfram
figure()
%-δ(t) + (1575 - 923.6 i)*e^((-1575 - 2749.43*i)*t)*((0.488228 + 0.872716 i) + e^((5498.86*i)*t))

t = 0:0.0001:0.008;
zw = dirac(t) - (1575 - 923.6*i)*e.^((-1575 - 2749.43*i)*t).*((0.488228 + 0.872716*i) -  e.^((5498.86*i)*t));

plot(t,zw);

%Matlab
figure()
%δ(t) - 3120*e^(-1575*t)*(cos(25*12095^(1/2)*t) + (4063*12095^(1/2)*sin(25*12095^(1/2)*t))/761985)


zm = -dirac(t) + 3120*e.^(-1575*t).*(cos(25*12095^(1/2)*t) - (4063*12095^(1/2)*sin(25*12095^(1/2)*t))/761985);
%en milisegundos
%t = 0:0.001:3;
%z = dirac(t/1000) - 3120*e.^(-1575*t/1000).*(cos(25*12095^(1/2)*t/1000) + (4063*12095^(1/2)*sin(25*12095^(1/2)*t/1000))/761985);

plot(t,zm);

%%%
%Calculo con wolfram la forma general de la antitransformada de 
%xh = s^2/(s^2 + a*s + b) = s^2/((s-p1)(s-p2)), es zp donde p1 y p2 son los polos de h;
% Linv {-s^2/((s-a)(s-b))} = -{(a^2*e^(a*t))/(a - b) - (b^2*e^(b*t))/(a - b) + δ(t)}
figure()
poles = [roots(h_d)]';
p1 = poles(1);
p2 = poles(2);
zp = -(p1^2/(p1-p2))*e.^(p1*t) + (p2^2/(p1-p2))*e.^(p2*t) - dirac(t);
plot(t,zp);
