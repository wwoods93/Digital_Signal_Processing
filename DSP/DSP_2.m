%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Digital Signal Processing
% Spring 2021
% Assignment 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check Problem 1 results
syms t

e1 = 2 * cos( 6 * pi * t + ( pi / 6 ) ) * 2 * cos( 6 * t - ( pi / 3 ) )
e2 = 2 * cos( 6 * t - ( pi / 3 ) ) * -2 * cos( 10 * t )
a = int( e1, t, -1, 1 )
b = int( e1, t, -pi, pi )
c = int( e2, t, -pi, pi )

clear variables;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2

t = 0 : 0.01 : 3;
z = exp( -t ) .* ( ( t >= 1 ) & ( t <= 3 ) )
hold on
figure ( 1 );
grid on
plot( t, z )

n = -40 : 1 : 40;
T = 4;
wo = 2 * pi / T;
k = 1;
x = zeros( 1, length( t ) );

 for i = 1 : length( n )
    x = x + ( 1 / ( 4 + ( 4 * 1i * n( k ) * wo ) ) ) * ( exp( -( 1 + 1i * n( k ) * wo ) ) - exp( -( 1 + 1i * n( k ) * wo ) * 3 ) .* exp( 1i * n( k ) * wo .* t ) );
    k = k + 1;
    plot( t, x )
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Problem 3, imaginary part, k = 2, k = 12
clear variables;
hold on
figure ( 2 );

n = 0 : 1 : 1000;

x = exp( 1i * 2 * pi * n / 10 );


plot( n( 1 : 25 ), imag( x( 1 : 25 ) ), 'bs');

y = exp( 1i * 2 * pi * 11 * n / 10 );
plot( n( 1 : 25 ), imag( y( 1 : 25 ) ), 'r' );
legend( { 'k = 2', 'k = 12' }, 'Location', 'southwest' )
title( 'Imaginary' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 4

n = 1 : 0.1 : 10;
s3 = exp( 1i * 6 * pi * n / 10 );
s7 = exp( 1i * 14 * pi * n / 10 );

sum37 = sum( s3 .* s7 )

% sum37 = 1.0000 - 0.0000i

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 5

n = 0 : 30;
c1 = 0.9 * exp( 1i * pi / 3 );
c2 = 1.2 * exp( 1i * pi / 6 );
w1 = c1 .^ n;
w2 = c2 .^ n;
figure ( 3 )
stem( n, imag( w1 ) );
title( 'c = 0.9 * exp(1i*pi/3)' )
figure ( 4 );
stem( n, imag( w2 ) );
title( 'c = 1.2 * exp(1i*pi/6)' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
