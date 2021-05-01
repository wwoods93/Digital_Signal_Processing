%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Zero Input and Zero State Responses from Simulation Diagram
% Assignment 4 Problem 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ZIR w/ y1( 0 ) = y2( 0 ) = 2, y3( 0 ) = 1

N = 100;

% zero input sequence
Xzir = 0 * ones( N + 1, 1 );
time = [ 0 : N ];
Yzir1( 1 ) = 2;
Yzir2( 1 ) = 2;
Yzir3( 1 ) = 1;

for k = 1 : N
    Yzir1( k + 1 ) = Xzir( k ) - 0.45 * Yzir2( k ) + 1.4 * Yzir1( k );
    Yzir2( k + 1 ) = Yzir1( k );
    Yzir3( k + 1 ) = 1.05 * Yzir3( k );
    Yzir( k ) = Yzir2( k ) + 2 * Yzir3( k );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yzir( N + 1 ) = Yzir2( N + 1 ) + 2 * Yzir3( N + 1 );

plot( time, Yzir, 'o' )
title( "Zero Input Response" )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ZSR w/ x( k ) = unit step

N = 100;

% unit step
Xzsr = ones( N + 1, 1 );
time = [ 0 : N ];
Yzsr1( 1 ) = 0;
Yzsr2( 1 ) = 0;
Yzsr3( 1 ) = 0;

for k = 1 : N
    Yzsr1( k + 1 ) = Xzsr( k ) - 0.45 * Yzsr2( k ) + 1.4 * Yzsr1( k );
    Yzsr2( k + 1 ) = Yzsr1( k );
    Yzsr3( k + 1 ) = 1.05 * Yzsr3( k );
    Yzsr( k ) = Yzsr2( k ) + 2 * Yzsr3( k );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Yzsr( N + 1 ) = Yzsr2( N + 1 ) + 2 * Yzsr3( N + 1 );

plot( time, Yzsr, 'x' )
title( "Zero State Response" )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
