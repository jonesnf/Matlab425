%Nate Jones
disp('Recording voice...');
r = audiorecorder(8000, 16, 1);
recordblocking(r, 2);
disp('Done recording...');
x = getaudiodata(r, 'double');
clear sum                            %for some reason I need this at one point to run program
    

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

error = x2 - z;

relErr = sum((abs(error).^2)) / sum((abs(x2).^2));

disp(relErr);
disp('Finished');
keydown = waitforbuttonpress;

%%%%%%%------Waiting for key press to start part two-------%%%%%%%

disp('Recording voice...');
r = audiorecorder(44100, 16, 1);
recordblocking(r, 2);
disp('Done recording...');
x = getaudiodata(r, 'double');

x2 = x;
x2 = (x2 ./ max(abs(x2)))*0.95;

    
%r = audioplayer(x2, 44100);
%play(r);
    
noise = randn(length(x2), 1);

noise = (noise ./ max(abs(noise))) * 0.1;
y = x2 + noise;

%r = audioplayer(y, 44100);
%play(r);

a = 1;
b = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
z = filter(b, a, y);


%r = audioplayer(y, 44100);
%play(r);

error = x2 - z;
relErr = sum(abs(error).^2)./ sum(abs(x2).^2);

audiowrite('hw06Origin_44100.wav', x2, 44100);
audiowrite('hw06Noise_44100.wav', y, 44100);
audiowrite('hw06Filter_44100.wav', z, 44100);

disp(relErr);
disp('Finished program');