%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Transfer Function  ZSR Comparison
% Assignment 8 Problem 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% plot frequency response for transfer function:
% H( z ) =  [ ( z + 1 ) / ( z - 0.9 ) ]

hNz = [ 1 1 ];
hDz = [ 1 -0.9 ];
figure ( 1 );
freqz( num, den );
title( [ 'H(z) Frequency Response' ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% generate input sequences
for n = 1 : 50
   x1( n ) = 1;
   x2( n ) = cos( ( n - 1 ) * ( pi / 4 ) );
   x3( n ) = ( - 1 ) ^ ( n - 1 );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 50;
time = [ 0 : N ];

w1( 1 ) = 0;
w2( 1 ) = 0;
w3( 1 ) = 0;

% calculate ZSR to 3 input sequences
for k = 1 : N
    w1( k + 1 ) = 0.9 * w1( k ) + x1( k );
    w2( k + 1 ) = 0.9 * w2( k ) + x2( k );
    w3( k + 1 ) = 0.9 * w3( k ) + x3( k );
    
    y1( k ) = w1( k + 1 ) + w1( k );
    y2( k ) = w2( k + 1 ) + w2( k );
    y3( k ) = w3( k + 1 ) + w3( k );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

