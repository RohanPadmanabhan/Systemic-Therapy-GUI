function [predictions] = formulaPredict(abcd, initScore, rest)

% Calculates the below function for weeks 1 to 12;
% S(t) = (a + b*t) + ((c + d*t) * S(0)) + rest
% S(t) = op1 + op2 + op3

% Time intervals
numWeeks = 24;
t = 0:numWeeks;

% Calculate the first part of the sum formula
op1 = abcd(1) + (abcd(2) * t);

% Calculate the second part of the sum formula
op2 = (abcd(3) + (abcd(4) * t)) * initScore;

% Calculate the third part of the formula
op3 = repmat(rest, 1, numWeeks+1);

% Sum the operands
predictions = op1 + op2 + op3;

