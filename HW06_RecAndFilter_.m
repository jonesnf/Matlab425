%Nate Jones
for test = 1 : 2
 if test == 1 
    r = audiorecorder(8000, 16, 1);
    recordblocking(r, 3);
    disp('Done recording...');
    x = getaudiodata(r, 'double');

    x2 = x;
    x2 = (x2 ./ max(abs(x2)))*0.95;

    noise = randn(length(x2), 1);

    noise = (noise ./ max(abs(noise))) * 0.1;

    y = x2 + noise;

    a = 1;
    b = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
    z = filter(b, a, y);

    error = x - z;


    disp('Finished');
 elseif test == 2
    r = audiorecorder(8000, 16, 1);
    recordblocking(r, 3);
    disp('Done recording...');
    x = getaudiodata(r, 'double');

    x2 = x;
    x2 = (x2 ./ max(abs(x2)))*0.95;

    noise = randn(length(x2), 1);

    noise = (noise ./ max(abs(noise))) * 0.1;

    y = x2 + noise;

    a = 1;
    b = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
    z = filter(b, a, y);

    error = x - z;


    disp('Finished');
 end
end