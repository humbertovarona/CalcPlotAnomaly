function [MTXAnomaly, newTimesRange] = calcMatrixSeasAnomaly(VARIABLE, TimesRange, Season)

    MonthNumbers = GetSeason(Season);
    
    VARIABLE = squeeze(VARIABLE);
    iSeas = 0;
    newTimesRange = [];
    for iMon=1:length(TimesRange) - 3
        if sum(eq(MonthNumbers,month(TimesRange(iMon:iMon+2)))) == 3
            iSeas = iSeas + 1;
            newTimesRange = [newTimesRange, TimesRange(iMon)];
            newVARIABLE(:, :, iSeas) = mean(VARIABLE(:, :, iMon:iMon+2), 3, 'omitnan');
        end
    end
    
    MTXAnomaly = calcMatrixAnomaly(newVARIABLE);
    
end

