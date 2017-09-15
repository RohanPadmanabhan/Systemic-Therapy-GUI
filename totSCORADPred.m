function [weekPredictions, imprStatus] = totSCORADPred(biomarkers, isAza, initScore)

%% Calculate rest
coeffs = [3.99, 2.42, 2.33, 1.97, -3.11];
means = [1.248; 0.988; 0.938; 3.322; -0.093];
stdDevs = [0.713; 0.310; 0.210; 0.215; 0.971];
rest = calculateRest(coeffs, biomarkers, means, stdDevs);

%% Calculate improvement status
mcid = 9;
imprStatus = improvementStatus(rest, mcid);

%% Calculate prediction at different time points
if isAza
    abcd = [18.30, 0.11, 0.51, -0.02];
else
    abcd = [17.94, -1.58, 0.52, 0.01];
end

weekPredictions = formulaPredict(abcd, initScore, rest);