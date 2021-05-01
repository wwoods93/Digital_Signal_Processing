%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% FIR Approximation Step Response
% Assignment 11 Problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% create transfer function for G(s)
G = tf( 1,[ 1 1 ] );         

num = [ 1 0.9900 0.9801 0.9702 0.9606 ];
den = [ 1 0 0 0 0 ];
z = tf( 'z', 0.01 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% FIR approximations for different values of T
Ts = 0.01;
Gfir1 = tf( num, den, Ts ) 

Ts = 0.1;
Gfir2 = tf( num, den, Ts )

Ts = 1;
Gfir3 = tf( num, den, Ts )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure ( 1 );
subplot( 4, 1, 1 );
step( G );                            
title( 'Step Response G(s)' )

subplot( 4, 1, 2 );                             
step( Gfir1 );
title( 'Step Response for FIR Approx. w/ T = 0.01' );

subplot( 4, 1, 3 );
step( Gfir2 );
title( 'Step Response for FIR Approx. w/ T = 0.1' );

subplot( 4, 1, 4 );
step( Gfir3 );
title( 'Step Response for FIR Approx. w/ T = 1' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
