file = readtable("data\Raw_Data\s01_ex05.txt");

% only EEG channels with proper time stamps
clean_table = file(:, 2:5);
fs = 200; % sampling rate 200 Hz
delta_t = 1/fs; % time between next samples
samples_size = size(clean_table(:,1));
time = ((0:samples_size - 1)' * delta_t);

% table with correct time stamps
clean_table = addvars(clean_table,time, 'Before',1);

%% Visualization
figure;
subplot(4,1,1);
plot(clean_table.time, clean_table.EXGChannel0);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 1 - before filtration');
grid on
hold on

subplot(4,1,2);
plot(clean_table.time, clean_table.EXGChannel1);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 2 - before filtration');
grid on
hold on

subplot(4,1,3);
plot(clean_table.time, clean_table.EXGChannel2);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 3 - before filtration');
grid on
hold on

subplot(4,1,4);
plot(clean_table.time, clean_table.EXGChannel3);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 4 - before filtration');
grid on
hold on