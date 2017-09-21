function [sfRounded] = directionalSFRound(number, sigFig, isRoundUp)

% Rounds up or down to either a specified number of significant figures or
% to the nearest integer, whichever is less precise.

% Input 1 - An array or number to be rounded
% Input 2 - Number of significant figures to be used
% Input 3 - Boolean to determine whether to round up or down

% Try rounding and checking if is correct significance
rounded = roundUpOrDown(number, isRoundUp);
sfRounded = round(rounded, sigFig, 'significant');



while sfRounded ~= rounded
    
    % Decrease significance
    rounded = rounded / 10;
    rounded = roundUpOrDown(rounded, isRoundUp);
    rounded = rounded * 10;
    
    % Set up significance comparison
    sfRounded = round(rounded, sigFig, 'significant');
    
end


end


function [rounded] = roundUpOrDown(number, isRoundUp)

if isRoundUp
    rounded = ceil(number);
else
    rounded = floor(number);
end

end
