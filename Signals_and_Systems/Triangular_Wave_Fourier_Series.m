%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Triangular Wave Fourier Series Approximation
% Assignment 13 Problem 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms k x

F1( x ) = symsum( ( ( -1 ^ ( k - 1 ) ) * ( 8 / ( pi ^ 2 ) ) * ( 1 / k ^ 2 ) * sin( k * pi * x ) ), k, [ 1  5 ] );
F2( x ) = symsum( ( ( -1 ^ ( k - 1 ) ) * ( 8 / ( pi ^ 2 ) ) * ( 1 / k ^ 2 ) * sin( k * pi * x ) ), k, [ 1 10 ] );
F3( x ) = symsum( ( ( -1 ^ ( k - 1 ) ) * ( 8 / ( pi ^ 2 ) ) * ( 1 / k ^ 2 ) * sin( k * pi * x ) ), k, [ 1 15 ] );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T = linspace( -2 * pi , 2 * pi );
y1 = F1( T );
y2 = F2( T );
y3 = F3( T );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure ( 1 );

subplot( 3, 1, 1 );
plot( T, y1 )
title( '5 Terms of Triangle Wave Fourier Series' )
xticks( [ -2 * pi -pi 0 pi 2 * pi ] )
xticklabels( { '-2\pi','-\pi','0','\pi','2\pi' } )
grid on

subplot( 3, 1, 2 );
plot( T, y2 )
title( '10 Terms of Triangle Wave Fourier Series' )
xticks( [ -2 * pi -pi 0 pi 2 * pi ] )
xticklabels( { '-2\pi', '-\pi', '0', '\pi', '2\pi' } )
grid on

subplot( 3, 1, 3 );
plot( T, y3 )
title( '15 Terms of Triangle Wave Fourier Series' )
xticks( [ -2 * pi -pi 0 pi 2 * pi ] )
xticklabels( { '-2\pi', '-\pi', '0', '\pi', '2\pi' } )
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    