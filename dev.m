% Fetching the data.

load("data.mat")
acc_x = Acceleration.X;
acc_y = Acceleration.Y;
acc_z = Acceleration.Z;
t = Acceleration.Timestamp;


for i = 1:length(acc_x)

    if i == 1

        unscaled_g_x = acc_x(i)/9.80665;
        unscaled_g_y = acc_y(i)/9.80665;
        unscaled_g_z = acc_z(i)/9.80665;
    else
        unscaled_g_x = [unscaled_g_x; acc_x(i)/9.80665];
        unscaled_g_y = [unscaled_g_y; acc_y(i)/9.80665];
        unscaled_g_z = [unscaled_g_z; acc_z(i)/9.80665];
    end 
end

        % % A graph of noisy acceleration in the three axes.

% plot(t,unscaled_g_x,t,unscaled_g_y,t,unscaled_g_z);
% title("raw g against Time.");
% ylabel("g.");
% xlabel("Time, s.");
% legend("X-axis.","Y-axis.","Z-axis.");


% Data pre-Processing to remove Noise while deriving some quantities.

for i = 1:length(acc_x)
    if i == 1
        if acc_x(i) > 9.80665
            x = 9.80665;
            g_x = x/9.80665;
        elseif acc_x(i) < -9.80665
            x = -9.80665;
            g_x = x/9.80665;
        else
            x = acc_x(i);
            g_x = x/9.80665;
        end
    end

    if i ~= 1
        if acc_x(i) > 9.80665
            xx = 9.80665;
        elseif acc_x(i) < -9.80665
            xx = -9.80665;
        else
            xx = acc_x(i);
        end
    x = [x; xx];
    g_x = [g_x; xx/9.80665];
    
    end
end

for i = 1:length(acc_y)
    if i == 1
        if acc_y(i) > 9.80665
            y = 9.80665;
            g_y = y/9.80665;
        elseif acc_y(i) < -9.80665
            y = -9.80665;
            g_y = y/9.80665;
        else
            y = acc_y(i);
            g_y = y/9.80665;
        end
    end

    if i ~= 1
        if acc_y(i) > 9.80665
            yy = 9.80665;
        elseif acc_y(i) < -9.80665
            yy = -9.80665;
        else
            yy = acc_y(i);
        end
    y = [y; yy];
    g_y = [g_y;yy/9.80665];
    end
end


for i = 1:length(acc_z)
    if i == 1
        if acc_z(i) > 9.80665
            z = 9.80665;
            g_z = z/9.80665;
        elseif acc_z(i) < -9.80665
            z = -9.80665;
            g_z = z/9.80665;
        else
            z = acc_z(i);
            g_z = z/9.80665;
        end
    end

    if i ~= 1
        if acc_z(i) > 9.80665
            zz = 9.80665;
        elseif acc_z(i) < -9.80665
            zz = -9.80665;
        else
            zz = acc_z(i);
        end
    z = [z; zz];
    g_z = [g_z; zz/9.80665];
    end
end

        % A graph of noiseless g's in the three axes.

% plot(t,g_x,t,g_y,t,g_z)
% title("g against time,(processed).");
% ylabel("g");
% xlabel("Time, s.");
% legend("X-axis.","Y-axis.","Z-axis.")

for i = 1:length(x)

    if i == 1

        magnitude = sqrt(x(i)^2 + y(i)^2 + z(i)^2);
        magnitude_g = sqrt(g_x(i)^2 + g_y(i)^2 + g_z(i)^2);

    end
    if i ~= 1

        magnitude = [magnitude; sqrt(x(i)^2 + y(i)^2 + z(i)^2)];
        magnitude_g = [magnitude_g; sqrt(g_x(i)^2 + g_y(i)^2 + g_z(i)^2)];
    end
end 

    % |g|
% plot(t, magnitude_g);
% title("|g| against Time.");
% ylabel("magnitude_g, |g|.");
% xlabel("Time, s.");

% Find the acceleration.
    
for i = 1:length(magnitude_g)

    if i == 1

        acceleration = (magnitude_g(i+i) - magnitude_g(i)) * 9.80665;
    end
   if i ~= length(magnitude_g)

        acceleration = [acceleration; (magnitude_g(i+1) - magnitude_g(i)) * 9.80665];
   end 
end 

% plot(t, acceleration);
% title("Acceleration against Time.");
% ylabel("Acceleration, m/s^2.");
% xlabel("Time, s.");

%  Find the velocity; graph a

for i = 1:length(acceleration)

    if i == 1

        time_diff = milliseconds(t(i+1) -t(i));
        if time_diff > 0 | time_diff == 0
            velocity = (acceleration(i) * (time_diff/1000));
        end
        if time_diff < 0
            time_diff = milliseconds((1000 - t(i)) + t(i+1));
            velocity = (acceleration(i) * (time_diff/1000));
        end
    end

    if  i > 1 && i ~= length(x)

        time_diff = milliseconds(t(i+1) -t(i));
        if time_diff > 0 | time_diff == 0 && time_diff < 1001

            velocity = [velocity; (acceleration(i) * (time_diff/1000))]; % giving -ve values -ve means slowing down which is okay
        
        else
           
            time_diff = 754;
            velocity = [velocity; (acceleration(i) * (time_diff/1000))];
        end

    end
end

% plot(t(1:9231), velocity);
% title("Velocity against Time.");
% ylabel("Velocity, m/s.");
% xlabel("Time, s.");

% Find the distance. a value close to 180m.

for i = 1: length(velocity)

    if i == 1

        distance = (velocity(i) * (milliseconds(t(i+1) -t(i))/1000));
    end
    if i ~= 1

        distance = [distance; (velocity(i) * (milliseconds(t(i+1) -t(i))/1000))];
    end
end
% 
% plot(t(1:9231), distance);
% title("Distance against Time.");
% ylabel("Distance, m.");
% xlabel("Time, s.");


