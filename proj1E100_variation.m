function Q = proj1E100_variation(R)
%
% This function produces random variations of the elements of vector R,
% which are within 20% of the nominal ones.

m = length(R) ;
g = ones(1,m)+0.5*rand(1,m);
% Function rand(1,m) generates a random vector of size 1 x m, whose
% elements are between 0 and 1. The elements of vector g are therefore
% random numbers with values between 1 and 1.5.

Q = 0.8*(R.*g);
% Each element of R is multiplied by a random number between 1 and 1.5. The
% additional multiplication by 0.8 secures that the elements of Q satisfy:
% 0.8*R(i)<Q(i)<1.2*R(i). In other words, the elements of Q are within 20%
% of the values in R.
