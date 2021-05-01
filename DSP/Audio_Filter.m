%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Digital Signal Processing
% Audio Filter Design
% 4.28.2021
% Wilson Woods
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

% symbolic variables
syms n t Ho Hc F Fc Fs;

j = 1i;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% continuous-time symbolic algebra

% slope
m = ( Hc - Ho ) / Fc;

F_CT = ( m * ( F + Ho ) ) * exp( j * 2 * pi * F * t );

% -Fc < F < 0 , 0 < F < Fc
upper_CT = int(  F_CT, F, 0, Fc );
lower_CT = int( -F_CT, F, -Fc, 0 );

% result
integral_result_CT = upper_CT + lower_CT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% discrete-time impulse response symbolic algebra

m1 = Fs * m;
exp_F = exp( j * 2 * pi * F * n );

% -Fc < F < 0 , 0 < F < Fc
lower = ( -m1 * F + Ho ) * exp_F;
upper = (  m1 * F + Ho ) * exp_F;

lower_integral = int( lower, F, -Fc / Fs, 0 );
upper_integral = int( upper, F, 0, Fc / Fs );

% result
h(n) = lower_integral + upper_integral

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% discrete-time impulse response plot

% sub in for syms in impulse response
h_subs = subs( h(n) , [ Ho, Hc, Fc, Fs ] , [ 0.15, 1, 5000, 20000 ] );

% plot points
impulse_range = [ -100 : -1 , 1 : 100 ];

% substitute plot points for sym n
impulse_subs = subs( h_subs, n, impulse_range );

% plot impulse response
figure (1);
stem( impulse_range, real( impulse_subs ), '-p', 'MarkerSize', 2,'MarkerEdgeColor','red', 'MarkerFaceColor', 'red' );
grid on;
ylim( [ -0.2 0.2 ] );
xlabel( 'Discrete Time [ n ]' );
ylabel( 'Implulse Response [ h(n) ]' );
title( '[Task 3] Discrete Time Impulse Response of Low Pass Filter, Fs = 20kHz' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nmax = 20;
num_samples = 2 * nmax + 1;

range = [ -num_samples : -1, 1 : num_samples ];

% exponent for window expressions
exp_F_Fs = exp( -j * 2 * pi * F / Fs * n );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% rectangular window

% initialize the frequency response before iterating
rect_H(F) = 0 * F + limit( h_subs );

% create rectangular window
rect_window = piecewise( -num_samples < n < num_samples, 1, n <= num_samples, 0, n >= num_samples, 0 );

% conv expression
rect_response(n) = h(n) * rect_window * exp_F_Fs;

% iterative calculation of impulse response
for n = range
    rect_H(F) = rect_H(F) + rect_response(n);
end

% sub in for syms in impulse response
rect_subs = subs( rect_H(F), [ Ho, Hc, Fc, Fs ], [ 0.15, 1, 5000, 20000 ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot impulse response applied to rectangular window
figure (2);
fplot( rect_subs, [ -10000, 10000 ] );
grid on;
ylim( [ -0.1 1.1 ] );
xlabel( 'F [ Hz ]' );
ylabel( 'Magnitude H(F)' );
title( '[Task 4] Frequency Response: Impulse Response Applied to Rectangular Window, Fs = 20kHz' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hamming window

% start fresh, eliminate syms being overshadowed by old values
clear all;

syms n Ho Hc F Fc Fs;
j = 1i;

nmax = 20; 
num_samples = 2 * nmax + 1;
bound = ( num_samples - 1 ) / 2;

% exponent expression with F
exp_F = exp( j * 2 * pi * F * n );

% exponent expression with F / Fs
exp_F_Fs = exp( -j * 2 * pi * F / Fs * n );

% slope
m = Fs * (Hc - Ho) / Fc;

lower = ( -m * F + Ho ) * exp_F;
upper = (  m * F + Ho ) * exp_F;
lower_integral = int( lower, F, -Fc / Fs, 0 );
upper_integral = int( upper, F, 0, Fc / Fs );

% impulse response
h(n) = lower_integral + upper_integral;

% sub in for syms in impulse response
h_subs = subs( h(n), [ Ho, Hc, Fc, Fs ], [ 0.15, 1, 5000, 20000 ] );

% create the Hamming window
hamming_window(n) = piecewise(0 <= n <= num_samples, 0.54 - 0.46 * cos( ( 2 * pi * n ) / ( num_samples - 1 ) ), n < 0, 0, n > num_samples, 0);

hamming_lower_H(F) = symsum( h(n) * hamming_window ( n + bound ) * exp_F_Fs, n, -bound, -1 );
hamming_upper_H(F) = symsum( h(n) * hamming_window ( n + bound ) * exp_F_Fs, n, 1, bound );
hamming_middle_H(F) = limit( h_subs ) * hamming_window ( bound );

% sum the components
hamming_H(F) = hamming_lower_H(F) + hamming_middle_H(F) + hamming_upper_H(F);

% sub in for syms in calculated frequency response
hamming_subs = subs( hamming_H(F), [ Ho, Hc, Fc, Fs ], [ 0.15, 1, 5000, 20000 ] );

% Plotting h(n)
figure (3);
fplot( hamming_subs, [ -10000 10000 ] )
grid on;
ylim( [ -0.1 0.9 ] );
xlabel( 'F [ Hz ]' );
ylabel( 'Magnitude H(F)' );
title( '[Task 5] Frequency Response: Impulse Response Applied to Hamming Window, Fs = 20kHz' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Blackman window

% create the Blackman window
blackman_window(n) = piecewise( 0 <= n <= num_samples, 0.42 - 0.5 * cos( ( 2 * pi * n ) / ( num_samples - 1 ) ) + 0.08 * cos( ( 4 * pi * n ) / ( num_samples - 1 ) ), n < 0, 0, n > num_samples, 0);

blackman_lower_H(F)  = symsum( h(n) * blackman_window( n + bound ) * exp_F_Fs, n, -bound, -1 );
blackman_upper_H(F)  = symsum( h(n) * blackman_window( n + bound ) * exp_F_Fs, n, 1, bound );
blackman_middle_H(F) = limit( h_subs) * blackman_window( bound );

% sum the components
blackman_H(F) = blackman_lower_H(F) + blackman_middle_H(F) + blackman_upper_H(F);

% sub in for syms in calculated frequency response
blackman_subs = subs( blackman_H(F), [ Ho, Hc, Fc, Fs ], [ 0.15, 1, 5000, 20000 ] );

% plotting h(n)
figure (4);
fplot( blackman_subs, [ -10000 10000 ] )
grid on;
ylim( [ -0.1 0.9 ] );
xlabel( 'F [ Hz ]' );
ylabel( 'Magnitude H(F)' );
title( '[Task 6] Frequency Response: Impulse Response Applied to Blackman Window, Fs = 20kHz' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% apply filters to audio file

% read in the audio file
[wav, wav_fs] = audioread('DSP_Audio_Filter_Project.wav');

hn_subs(n)= subs( h(n), [ Ho, Hc, Fc, Fs ], [ 0.15, 1, 5000, 20000 ] );

rect_window(n) = piecewise( 0 <= n <= num_samples, 1, n < 0, 0, n > num_samples, 0 );

rectangular_hn = zeros( 1, num_samples );
hamming_hn     = zeros( 1, num_samples );
blackman_hn    = zeros( 1, num_samples );

count = 1;

for index_L = -bound : -1
    rectangular_hn(count)= subs( hn_subs(n) *     rect_window( n + bound ), n, index_L );
    hamming_hn(count)=     subs( hn_subs(n) *  hamming_window( n + bound ), n, index_L );
    blackman_hn(count)=    subs( hn_subs(n) * blackman_window( n + bound ), n, index_L );
    count = count + 1;
end

rectangular_hn(count) = limit( h_subs ) * rect_window( bound );
hamming_hn(count)     = limit( h_subs ) * hamming_window(bound);
blackman_hn(count)    = limit( h_subs ) * blackman_window(bound);
count = count + 1;

for index_U = 1 : bound
    rectangular_hn(count) = subs( hn_subs(n) *     rect_window( bound ), n, index_U );
    hamming_hn(count)     = subs( hn_subs(n) *  hamming_window( bound ), n, index_L );
    blackman_hn(count)    = subs( hn_subs(n) * blackman_window( bound ), n, index_L );
    count = count + 1;
end
rectangular_hn = double( rectangular_hn );
hamming_hn     = double( hamming_hn );
blackman_hn    = double( blackman_hn );

wav_rec   = conv( rectangular_hn, wav );
wav_ham   = conv( hamming_hn, wav );
wav_black = conv( blackman_hn, wav );

audiowrite('rect.wav', real( wav_rec ), wav_fs);
audiowrite('hamming.wav', real( wav_ham ), wav_fs);
audiowrite('blackman.wav', real( wav_black ), wav_fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot and listen to filter outputs

[ rect_wav, wav_fs ]     = audioread('rect.wav');
[ hamming_wav, wav_fs ]  = audioread('hamming.wav');
[ blackman_wav, wav_fs ] = audioread('blackman.wav');

% play original
% sound(wav, wav_fs);

% play rectangular
% sound(rect_wav, wav_fs);

% play Hamming
% sound(hamming_wav, wav_fs);

% play Blackman
% sound(blackman_wav, wav_fs);

figure(5);
plot( rect_wav );
title ('[Task 7] Rectangular Window Output Waveform')

figure(6);
plot( hamming_wav );
title ('[Task 7] Hamming Window Output Waveform')
ylim( [ -1.5 1.5 ] );

figure(7);
plot( blackman_wav );
title ('[Task 7] Blackman Window Ouput Waveform')
ylim( [ -1.5 1.5 ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
