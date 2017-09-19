function [values] = thresholdData(values, minimum, maximum)

% Remove values below the minimum
normLocs = (values < minimum);
values = values .* ~normLocs;
values = values + (normLocs * minimum);

% Remove values above the maximum
normLocs = (values > maximum);
values = values .* ~normLocs;
values = values + (normLocs * maximum);