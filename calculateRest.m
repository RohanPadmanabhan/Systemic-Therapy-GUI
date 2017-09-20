function [rest] = calculateRest(coeffs, biomarkers, means, stdDevs)

biomarkers = log10(biomarkers);
normBiomarkers = (biomarkers - means) ./ stdDevs;
rest = coeffs * normBiomarkers;

