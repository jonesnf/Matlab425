%Nate Jones
disp('Recording voice...');
r = audiorecorder(8000, 16, 1);
recordblocking(r, 3);
disp('Done recording...');
x = getaudiodata(r, 'double');
    
    

x2 = x;
x2 = (x2 ./ max(abs(x2)))*0.95;

    
%r = audioplayer(x2, 8000);
%play(r);
    
noise = randn(length(x2), 1);

noise = (noise ./ max(abs(noise))) * 0.1;

y = x2 + noise;
    
    
%r = audioplayer(y, 8000);
%play(r);
    
a = 1;
b = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
z = filter(b, a, y);


%r = audioplayer(y, 8000);
%play(r);

audiowrite('hw06Origin_8000.wav', x2, 8000);
audiowrite('hw06Noise_8000.wav', y, 8000);
audiowrite('hw06Filter_8000.wav', z, 8000);


%error = zeros(size(x2));
%error = x2 - z;
    
relErr = zeros(size(x2));
sum = zeros(size(x2));
total = 0;
    
    for i = 1: numel(x2)
        sum(i) = sqrt(abs(x(i) - z(i)));
        relErr(i) = sum(i) ./ sqrt(abs(x(i)));   
        total  = total + relErr(i);
    end
    
disp('Finished');
keydown = waitforbuttonpress;
    
disp('Recording voice...');
r = audiorecorder(44100, 16, 1);
recordblocking(r, 3);
disp('Done recording...');
x = getaudiodata(r, 'double');

 x2 = x;
 x2 = (x2 ./ max(abs(x2)))*0.95;

    
 r = audioplayer(x2, 44100);
 play(r);
    
noise = randn(length(x2), 1);

noise = (noise ./ max(abs(noise))) * 0.1;
y = x2 + noise;

r = audioplayer(y, 44100);
play(r);

a = 1;
b = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
z = filter(b, a, y);


r = audioplayer(y, 44100);
play(r);

error = x - z;
    
relErr = zeros(size(x2));
sum = zeros(size(x2));
total = 0;
    
    for i = 1: numel(x2)
        sum(i) = sqrt(abs(x(i) - z(i)));
        relErr(i) = sum(i) ./ sqrt(abs(x(i)));   
        total  = total + relErr(i);
    end

disp('Finished');