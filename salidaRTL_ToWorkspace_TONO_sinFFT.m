close all;
clc;


%Uso de la funcion pspectrum para calcular potencias

s = out.salida;
maxValorMatrix = max(s); % Valor del maximo valor de cada columna
%ultimoValorMatrix = out.salida(1001, :);%solo ultimos valores de la matriz

%pspectrum(maxValorMatrix,Fs); % Power spectrum
%pspectrum(ultimoValorMatrix,Fs); % Power spectrum

%%
N2 = 4095;
p = pspectrum(maxValorMatrix,Fs); % Returns the power spectrum of a vector or matrix signal sampled at a rate fs
[~,indiceValorMaximo] = max(p); % Indice donde se encuentra ese maximo valor de todas las columnas
f = Fc + Fs/N2*(0:N2)-Fs/2;
figure;plot(f,10*log10(p));xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBW)');title('Power Spectrum (dBW) A');
grid on;
figure;plot(f,(10*log10(p))+30);xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBm)');title('Power Spectrum (dBm) A');
grid on;

peak_max_dBW = max(10*log10(p));
peak_max_dBm = max((10*log10(p)))+30;



%%
%{
N2 = 4095;
p2 = pspectrum(ultimoValorMatrix,Fs); % Returns the power spectrum of a vector or matrix signal sampled at a rate fs
f = Fc + Fs/N2*(0:N2)-Fs/2;
figure;plot(f,10*log10(p2));xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBW)');title('Power Spectrum (dBW) B');
grid on;
figure;plot(f,(10*log10(p2))+30);xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBm)');title('Power Spectrum (dBm) B');
grid on;

peak_ultimo_dBW = max(10*log10(p2));
peak_ultimo_dBm = max((10*log10(p2)))+30;
%}

%Uso de la funcion periodogram para calcular potencias
%%
P = periodogram(maxValorMatrix,[],N,Fs,'centered','power');
fRf   = Fc + Fs/N*(0:N-1)-Fs/2;
figure;plot(fRf,10*log10(P));xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBW)');title('Power Spectrum (dBW) Periodogram A');
grid on;
peak_dBW_periodogram_max = max(10*log10(P));

%%
%{
P2 = periodogram(ultimoValorMatrix,[],N,Fs,'centered','power');
fRf   = Fc + Fs/N*(0:N-1)-Fs/2;
figure;plot(fRf,10*log10(P2));xlabel('Frequency (Hz)');ylabel('Power Spectrum (dBW)');title('Power Spectrum (dBW) Periodogram B');
grid on;
peak_dBW_periodogram_ultimo = max(10*log10(P2));
%}
