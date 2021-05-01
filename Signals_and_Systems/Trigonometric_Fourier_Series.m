%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Trigonometric Fourier Series
% Assignment 13 Problem 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% angular frequency
w0 = 2 * pi;

% create sequence for t
t = -2 * pi : 0.001 : 2 * pi;

x = 0;

% alpha(n) = an - jbn
for n = 1:1000
    bn = 2 * (-1) ^ n / n;
    x = x + 2 * bn * sin( w0 * n * t);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot( t, x, 'linewidth',2 );
grid;
xticks( [ -2 * pi -pi 0 pi 2 * pi ] )
xticklabels( { '-2\pi', '-\pi', '0', '\pi', '2\pi' } )
ylabel( 'A' )
title( 'Trigonometric Form Fourier Series, T0 = 1, 1000 Terms' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
