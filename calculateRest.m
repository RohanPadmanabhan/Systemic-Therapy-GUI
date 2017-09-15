function [rest] = calculateRest(coeffs, biomarkers, means, stdDevs)

normBiomarkers = (biomarkers - means) ./ stdDevs;
rest = coeffs * normBiomarkers;

