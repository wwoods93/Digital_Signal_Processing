%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% FIR Approximation Comparison
% Assignment 8 Problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ts = -1;

% numerator of G( z )
gN = [ 1 0.5 0.25 0.125 ];

% denominator of G( z )
gD = [ 1 0 0 0 0 ];

% construct transfer function
g = tf( gN, gD, Ts );

% numerator of H( z )
hN = 1;

% denominator of H( z )
hD = [ 1 -0.5 0 ];
h = tf( hN, hD, Ts );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot step response of original TF vs FIR approximation
figure ( 1 );
step( g, h );
ylim( [ 0 3 ] );
title( [ 'Step Responses' ] );
legend( 'G(z)', 'H(z)' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gNz = [ 1 0.5 0.25 0.125 ];
gDz = [ 1 0 0 0 0 ];
figure ( 2 );
freqz( num, den );
title( [ 'G(z) Frequency Response' ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hNz = 1;
hDz = [ 1 -0.5 0 ];
figure ( 3 );
freqz( num, den );
title( [ 'H(z) Frequency Response' ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%