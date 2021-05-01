%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Bilinear Step Response
% Assignment 11 Problem 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% use T = 0.01, 0.1, 1
% transform using step invariance

% create transfer function for G(s)
% use cts to discete function for bilinear
% transform of G(s)
G = tf( 1, [ 1 1 ] );
Hz1 = c2d( G, 0.01 );
Hz2 = c2d( G, 0.1 );
Hz3 = c2d( G, 1 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure ( 1 );
subplot( 4, 1, 1 );
step( G );                            
title( 'Step Response G(s)' )
    
subplot( 4, 1, 2 );                             
step( Hz1 );
title( 'Step Response for T = 0.01' )

subplot( 4, 1, 3 );
step( Hz2 );
title( 'Step Response for T = 0.1' )

subplot( 4, 1, 4 );
step( Hz3 );
title( 'Step Response for T = 1' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
