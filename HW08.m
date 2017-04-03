%Nate Jones
disp('Recording voice...');
r = audiorecorder(11025, 16, 1);
recordblocking(r, 2);
disp('Done recording...');
x = getaudiodata(r, 'double');

x = x - mean(x);
x = (x ./ max(abs(x))) * 0.45;

r = audioplayer(x, 11025);
play(r);

%keydown = waitforbuttonpress;

audiowrite('hw08Origin_11025.wav', x, 11025);

h = [0.85 zeros(1, 3400) 0.55 zeros(1, 1600) 0.4 zeros(1, 3000) 0.3 zeros(1, 2200) 0.2];

y = conv(x,h);

noise = rand(length(7),1);

noise = (noise ./ max(abs(noise))) * 0.1;

y = noise + y;

r = audioplayer(y, 11025);
play(r);




