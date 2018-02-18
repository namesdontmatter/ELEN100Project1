function F = proj1E100_freqresp(G,C,L,b,w,Vg)
%
% G, C, L, b, w (rad/sec), and Vg are known vectors and matrices. F is the
% resultant power output in dB for plot purposes.

mag = [];
% We have to declare the matrix to not confuse MATLAB.

for iter = 1:length(w)
    % We have to solve the circuit for each value of w.
    % Since all these different values are stored in a vector w,
    % length(w) determines how many times we must execute the loop.
    
    omega = w(iter);
    % Omega is the next angular frequency in vector w.
    
    A = (G+(1i*omega*C)+(L/(1i*omega))) ;
    x = A\b;
    % Vector x contains the solution of the node voltage equations in
    % complex form.
    
    mag = [mag, abs(x)];
    % The function abs(x) computes the magnitudes of all voltages.
    % These magnitides are stored as a new column in matrix mag.
end;

V3 = mag(3,1:length(w));
% Since we are interested only in V3, we will extract row 3 of matrix mag.

F = 20*log10(V3/abs(Vg));
