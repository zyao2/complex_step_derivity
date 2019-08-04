function [F, J] = func3(x)
global ff
% Evaluate the vector function
n = length(x);
[J,F]=jacobiancsd(ff,x);
