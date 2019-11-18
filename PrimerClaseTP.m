%% Limpio todo
clear all;
close all;
clc

%% Me dan un pasa bajos de orden de frecuencia de corte 100Hz

%% pkg install -forge package_name

%% Cargo paquete de control
pkg load control
%pkg load symbolic

% Si tenes problema con los graficos

% graphics_toolkit('gnuplot');
% Tambien proba sacando las tildes, por las dudas


%% Algunas definiciones
w0 = sqrt(1.004*10^7);
f0 = w0/(2*pi);
Tau = 1/w0;

% La variable es s
s = tf('s');


% Transferencia 
%h = h_n/h_d
s_vec = [s^2; s; 1];

h_n = [1 0 0];
h_d = [1 3150 1.001*10^7];

h = (h_n*s_vec)/(h_d*s_vec);

% Hago el Bode
[Modulo_ideal,fase_ideal,w_ideal] = bode(h);
% Bode devuelve un vector de modulo, fase y la frecuencia angular a la que calcula estos valores
Modulo_ideal_dB = 20*log10(Modulo_ideal); % Lo pasamos de modulo a decibeles

figure()
semilogx(w_ideal,Modulo_ideal_dB) % Grafico semilogaritmico, con log en el eje x
xlabel('Pulsacion [rad/s]') % Titulo del eje x
ylabel('|H(jw)| [dB]') % Titulo del eje y
title('Bode de modulo transferencia ideal') % Titulo del grafico entero
grid on % Agrega grilla para visualizar mejor
axis([10^1 10^5 -25 5]) % Rango visible de la figura


figure()
semilogx(w_ideal,fase_ideal)
xlabel('Pulsacion [rad/s]')
ylabel('Arg(H(jw)) [°]')
grid on

 % Encuentro la respuesta al escalon
[Y_step_ideal,T_step_ideal] = step(h);
figure()
  plot(T_step_ideal, Y_step_ideal)
  title('Respuesta al escalon transferencia ideal')
  xlabel ('tiempo [s]');
  ylabel ('Tension [V]');
  legend ('respuesta ideal ');
  grid minor
 
 
% Encuentro la respuesta al impulso

[Y_impulse_ideal,T_impulse_ideal] = impulse(h);
% Si no funciona, recordar como sortear el problema (pasa altos y notch)
figure()
  plot(T_impulse_ideal, Y_impulse_ideal)
  title('Respuesta al impulso transferencia ideal')
  xlabel ('tiempo [s]');
  ylabel ('Tension [V]');
  legend ('respuesta ideal ');
  grid minor
 %%
 
 
 

 % Respuesta a cuadradas:
 
 % Defino una cuadrada de periodo 1/f0 y dura 5 periodos
 [cuad,t] = gensig('SQUARE' , 1/f0 , 5/f0); % Periodo de la cuadrada = 1/f0, duracion de la senial 5/f0
 %Ahora busco la respuesta al filtro con esto:
 figure()
 [V_cuad_f0_ideal,t_cuad_f0_ideal] = lsim(h,cuad,t);% Obtengo la respuesta a la senial 'cuad' 
  plot(t_cuad_f0_ideal,V_cuad_f0_ideal,'-b')
  hold on % Permite graficar varias curvas en la misma figura
  plot(t,cuad,'-r') % '-r' para definir el color rojo
  xlabel('tiempo [s]')
  ylabel('Tension [V]')
  title('Respuesta a la cuadrada f0 ideal')
  grid on
  axis([0 0.05 -.1 1.2])
  legend('Respuesta','Entrada') % Agrega un cuadro aclarando que curva tiene que color (Importa el orden)
  hold off % Permite que las curvas de ahora en mas aparezcan en otras figuras
 
 

 

 
 
 













