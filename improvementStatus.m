function [imprStatus] = improvementStatus(rest, mcid)

if (rest < -mcid/2)
    imprStatus = 'High improver';
elseif (rest > mcid/2)
    imprStatus = 'Low improver';
else
    imprStatus = 'Normal improver';
end