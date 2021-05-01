%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Bilinear Transform Plots
% Assignment 11 Problem 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

G = tf( [ 1 1 ],[ 1 2 2 ] );      % create transfer function for G(s)
Hz1 = c2d( G, 1 );             % use cts to discete function for bilinear
Hz2 = c2d( G, 0.1 );           % transform of G(s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pole-zero plots
figure ( 1 );

subplot( 2, 1, 1 );
pzplot( Hz1 );
title( 'Pole-Zero Map for T = 1' );

subplot( 2, 1, 2 );
pzplot( Hz2 );
title( 'Pole-Zero Map for T = 0.1' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% frequency response plots
figure ( 2 );
subplot( 2, 1, 1 );
bodemag( Hz1 );
grid;
title( 'Frequency Response for T = 1' )

subplot( 2, 1, 2 );
bodemag( Hz2 );
grid;
title( 'Frequency Response for T = 0.1' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% step response plots
figure ( 3 );
subplot( 2, 1, 1 );
step( Hz1 );
title( 'Step Response for T = 1' )

subplot( 2, 1, 2 );
step( Hz2 );
title( 'Step Response for T = 0.1' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
