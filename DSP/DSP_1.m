%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Digital Signal Processing
% Spring 2021
% Assignment 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 1
% x( t ) = c * sin( omega * t - theta )

% Problem 1 Part c
% f = 0.5 Hz, theta = 0, 30 deg, c = 3

t = linspace( -1, 2, 300 );

theta1 = 0;
theta2 = 30;
f = 0.5;
omega = 2 * pi * f;

x1t = 3 * sin( omega * t - theta1 );
x2t = 3 * sin( omega * t - theta2 );

figure ( 1 );
title( 'HW 1 Problem 1c' );
xlabel( 'Time (s)' );
ylabel( 'Magnitude' );

hold on;
plot( t, x1t, 'Color', 'k' );
plot( t, x2t, 'Color', 'g', 'Marker', 's' );
legend( { 'theta = 0 deg', 'theta = 30 deg' }, 'Location', 'southwest' )
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 2
z = nthroot( 3 + 0i, 5 )
p = []
p = zplane( z, p )
p.MarkerEdgeColor = 'r';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 3

f1 = 3 / 5;
f2 = sqrt( 2 ) / 5;
phi = 60;
n = -4 : 8;

y1 = 1.5 * cos( 2 * pi * f1 * n + phi );
y2 = 1.5 * cos( 2 * pi * f2 * n + phi );

figure ( 2 );
stem( n, y1 );
title( 'f = 3/5 Hz' );
xlabel( 'Time (s)' );
ylabel( 'Magnitude' );

figure( 3 );
stem( n, y2 );
title( 'f = sqrt(2) / 5 Hz' );
xlabel( 'Time (s)' );
ylabel( 'Magnitude' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Problem 4

n = -7 : 5;
z = 2.5 * cos( 0.5 * n + pi / 4 );

figure ( 4 );
stem( n, z );
title( 'z(n) = 2.5 * cos(0.5 * n + pi/4)' )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
