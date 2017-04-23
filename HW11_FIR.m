%Nate Jones
close all;
Fs = 8000;
filename = 'test_voice.wav';
[x, Fs] = audioread(filename);

audiowrite('testhw11_origin.wav', x, Fs);

figure;
freqz(x, 1, 1024, 8000);


wc1 = 2*pi*(2027/8000);
wc2 = 2*pi*(2400/8000);
N = 55;                              %picking random order
n = -((N-1)/2):((N-1)/2);            % centering around zero
n = n+(n==0)*eps;
[h] = -(sin(n * wc2) - sin(n * wc1))./( n * pi);
h(28) = 1 + h(28);

w = 1;
d = h .* w;


%[w] = 0.54 + 0.46*cos(2 * pi * n/N);
%d = h;
%fvtool(d, 1);

figure;
freqz(d, 1, 1024, 8000);

figure;
[y, f]= filter(d, 1, x);
freqz(y,1,1024,8000);

audiowrite('testHw11.wav',y,Fs);





