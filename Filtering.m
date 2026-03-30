% to read: Spectral Analysis of the Human EEG during Listening to Musical
% Compositions; Pavlygina R. A.
file = readtable("data\Raw_Data\s01_ex05.txt");
load 1to30FIR.mat; %filter loading

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
title('EEG Channel 1 - before filtering');
grid on
hold on

subplot(4,1,2);
plot(clean_table.time, clean_table.EXGChannel1);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 2 - before filtering');
grid on
hold on

subplot(4,1,3);
plot(clean_table.time, clean_table.EXGChannel2);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 3 - before filtering');
grid on
hold on

subplot(4,1,4);
plot(clean_table.time, clean_table.EXGChannel3);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 4 - before filtering');
grid on
hold on

%% Filtering data
%load 1to30FIR.mat %filter loading

for i = 2:5
    clean_table(:, i) = detrend(clean_table(:, i),5);
    clean_table{:, i} = filtfilt(Num, 1 ,clean_table{:, i});
end

% Visualization
figure;
subplot(4,1,1);
plot(clean_table.time, clean_table.EXGChannel0);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 1 - after filtering');
grid on
hold on

subplot(4,1,2);
plot(clean_table.time, clean_table.EXGChannel1);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 2 - after filtering');
grid on
hold on

subplot(4,1,3);
plot(clean_table.time, clean_table.EXGChannel2);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 3 - after filtering');
grid on
hold on

subplot(4,1,4);
plot(clean_table.time, clean_table.EXGChannel3);
xlabel('Time [s]');
xlim([10 15]);
ylabel('Magnitude [mV]');
title('EEG Channel 4 - after filtering');
grid on
hold on

%% Fourier transformation check
%for i = 1:4
    %y = fft(clean_table.EXGChannel0);

    NFFT = 4096;
    NOVERLAP = NFFT/2;
    WIN = hamming(NFFT);
    [P,F] = pwelch(clean_table.EXGChannel0,WIN,NOVERLAP,NFFT,fs);
    %f = (0:length(y)-1)*fs/length(y);
    figure
    %plot(f,abs(y))
    plot(F,P)
    xlabel('Frequency (Hz)')
    ylabel('Magnitude')
    title('Magnitude')
%end