function [weekPredictions, imprStatus] = oSCORADPred(biomarkers, isAza, initScore)

%% Calculate rest
coeffs = [2.92, 2.92, 2.12, -2.99, -4.25];
means = [1.248; 0.938; 0.809; 2.076; -0.093];
stdDevs = [0.713; 0.210; 0.326; 0.194; 0.971];
rest = calculateRest(coeffs, biomarkers, means, stdDevs);

%% Calculate improvement status
mcid = 9;
imprStatus = improvementStatus(rest, mcid);

%% Calculate prediction at different time points
if isAza
    abcd = [7.84, 0.14, 0.83, -0.02];
else
    abcd = [-0.7, -1.36, 0.64, 0.02];
end

weekPredictions = formulaPredict(abcd, initScore, rest);

%% Threshold the data
minimum = 0;
maximum = 83;
weekPredictions = thresholdData(weekPredictions, minimum, maximum);




