function [F, Qout] = proj1E100_freqresp_varied(QX,b,w,Vg,num)
%
% QX is a vector of length p that contains all the nominal element values.
% Resistors are listed first (as QX(1), QX(2), ..., QX(n)), then capacitors
% (QX(n+1), QX(n+2), ..., QX(m)), and finally inductors (QX(m+1), QX(m+2),
% ..., QX(p)). b, w (rad/sec), and Vg are known vectors and matrices. num
% is the number of different cases that we wish to simulate. F is the
% resultant power output matrix (dimnesions num x length(w)) in dB for plot
% purposes. Qout is the result component values during each iteration.

F = []; Qout = [];
% We have to declare the matrices to not confuse MATLAB.

% !!!IMPORTANT!!!
% Comment out the following line before final execution for submission.
rng('default');
% Puts the settings of the random number generator used by rand to their
% default values so that they produce the same random numbers as if you
% restarted MATLAB. In other words, this will produce a controlled solution
% to the component variation conditions in this solution file.

for iter = 1:num

    Q = proj1E100_variation(QX);
    % This function produces random variations of the element values, which
    % are within 20% of the nominal ones.
    
    Qout = [Qout; Q];
    % Store each set of component values for later use.
    
    G1 = [ ...
                (1)       (0)               (0); ...
                (-1/Q(1)) (1/Q(1) + 1/Q(2)) (-1/Q(2)); ...
                (0)       (-1/Q(2))         (1/Q(2))];

    G2 = [ ...
                (0)       (0)       (0); ...
                (0)       (Q(3))    (0); ...
                (0)       (0)       (Q(4))];

    G3 = [ ...
                (0)       (0)       (0); ...
                (0)       (0)       (0); ...
                (0)       (0)       (0)];
    % For each set of element values, the matrices G1, G2, and G3 must be
    % recomputed.
    
    FX = proj1E100_freqresp( G1,G2,G3,b,w,Vg);
    % Generates the frequency response values for the current set of
    % element values.
    
    F = [F; FX];
    % Each row of matrix F corresponds to a different set of element
    % values. You can plot them all at once, using the command
    % semilogx(w,F).

end;
