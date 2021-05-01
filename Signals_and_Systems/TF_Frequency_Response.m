%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The University of Akron
% Signals & Systems
% Fall 2020
% Transfer Function Frequency Response
% Assignment 8 Problem 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a = [ 0.95, 0.85, 0.75 ];

for x = 1 : length( a )
    num = 1 - a( x );
    den = [ 1 -a( x ) ];
    figure( x );
    freqz( num, den );
    title( [ 'a = ', num2str( a( x ) ) ] );
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EOF %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%