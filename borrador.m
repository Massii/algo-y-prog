pkg load symbolic
pkg load control
pkg load specfun

%h = s^2/(s^2 + a*s + b), a = 3510, b = 1.004*10^7

a = 3510;
b = 1.004*10^7;

s = tf('s');

s_vec = [s^2; s; 1];

h_n = [1 0 0];
h_d = [1 3510 1.004*10^7];

h = (h_n*s_vec)/(h_d*s_vec);

syms q t
F = q^2/(q^2 + 3510*q + 1.004*10^7);
y = ilaplace(F, q, t);


%Calculo con Wolfram, Matlab y "manualmente" la antitransformada de H
%H = s^2/(s^2 + 3150*s + 1.004*10^7)
%Obtengo la misma respuesta con Wolfram que  manualmente
%
t = 0:0.0001:0.008;
%Wolfram
zw = dirac(t) - (1755 - 735.347*i)*e.^((-1755 - 2638.18*i)*t).*((0.701314 + 0.712852*i) + e.^((5276.35*i)*t));

figure()
 plot(t,zw);
 title('Wolfram');
%δ(t) - (1755 - 735.347*i)*e^((-1755 - 2638.18*i)*t)*((0.701314 + 0.712852*i) + e^((5276.35 i)*t))




%Matlab ---------------MAL LOS DATOS-- USE a = 3150 en lugar de 3510--------- Borrar los %%
%%figure()
%%title('Matlab')
%δ(t) - 3120*e^(-1575*t)*(cos(25*12095^(1/2)*t) + (4063*12095^(1/2)*sin(25*12095^(1/2)*t))/761985)

%%zm = -dirac(t) + 3120*e.^(-1575*t).*(cos(25*12095^(1/2)*t) - (4063*12095^(1/2)*sin(25*12095^(1/2)*t))/761985);
%en milisegundos
%t = 0:0.001:3;
%z = dirac(t/1000) - 3120*e.^(-1575*t/1000).*(cos(25*12095^(1/2)*t/1000) + (4063*12095^(1/2)*sin(25*12095^(1/2)*t/1000))/761985);

%%plot(t,zm);

%%%
%Calculo con wolfram la forma general de la antitransformada de 
%h = s^2/(s^2 + a*s + b) = s^2/((s-p1)(s-p2)), es zp donde p1 y p2 son los polos de h;
% Linv {s^2/((s-a)(s-b))} = δ(t) + (a^2*e^(a*t))/(a - b) - (b^2*e^(b*t))/(a - b)
poles = [roots(h_d)]';
p1 = poles(1);
p2 = poles(2);
zp = dirac(t) + (p1^2/(p1-p2))*e.^(p1*t) - (p2^2/(p1-p2))*e.^(p2*t);

figure()
 plot(t,zp);
 title('Manual');



%%%RESPUESTA AL ESCALON 
%H = h
%si u = escalon entonces U = 1/s entonces Y = H*U = H/s
%Calculo con wolfram la forma general de la antitransformada de Y
%Y = s/(s^2 + a*s + b) = s/((s-p1)(s-p2)), es zp donde p1 y p2 son los polos de h;
% Linv {s/((s-a)(s-b))} = (a*e^(a*t))/(a - b) - (b*e^(b*t))/(a - b)
z_step = (p1/(p1-p2))*e.^(p1*t) - (p2/(p1-p2))*e.^(p2*t);
figure()
 plot(t,z_step);
 title('Respuesta al escalón');
 axis([0 0.003])
 
 %%DETERMINACION DE COMPONENTES
 %a = (c1 + c2 + c3)/(r2*c2*c3);
 %b = 1/(r1*r2*c2*c3);
 c = 10^(-5)/(f0);
 r1 = a/(3*c*w0^2);
 r2 = 1/(b*r1*c^2);
