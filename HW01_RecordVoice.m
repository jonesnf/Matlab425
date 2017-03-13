%Nate Jones
r = audiorecorder(11025, 16, 1);
recordblocking(r, 3);
disp('Done recording...');
x = getaudiodata(r, 'double');

x2 = x;
x2 = (x2 ./ max(abs(x2)))*0.95;

r = audioplayer(x2, 11025);
 
disp('Writing .wav file...');
audiowrite('hw01SecWave.wav', x2, 11025);
audiowrite('hw01ThdWave.wav', x2, 22050);

z1 = zeros(1, 29);
z2 = zeros(1, 69);
a = 1;
b = [0.7 z1 0.2 z2 0.1];
t = 1:length(x2);
y = filter(b,a,x2);

audiowrite('hw01FilterWave.wav', y, 11025);


figure;
plot(x2);
plot(t,x2,'-',t,y,'-');

disp('Finished');
 