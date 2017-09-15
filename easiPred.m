function [weekPredictions, imprStatus] = easiPred(biomarkers, isAza, initScore)

%% Calculate rest
coeffs = [3.72, 2.39, -1.52, -2.67, -3.77];
means = [0.938; 0.809; 0.025; 2.076; -0.093];
stdDevs = [0.210; 0.326; 0.747; 0.194; 0.971];
rest = calculateRest(coeffs, biomarkers, means, stdDevs);

%% Calculate improvement status
mcid = 7.5;
imprStatus = improvementStatus(rest, mcid);

%% Calculate prediction at different time points
if isAza
    abcd = [-7.89, 0.06, 0.79, -0.03];
else
    abcd = [-3.21, -0.22, 0.97, -0.01];
end

weekPredictions = formulaPredict(abcd, initScore, rest);