function [weekPredictions, imprStatus] = oSCORADPred(biomarkers, isAza, initScore)

%% Calculate rest
coeffs = [2.92, 2.92, 2.12, -2.99, -4.25];
rest = coeffs * biomarkers;

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




