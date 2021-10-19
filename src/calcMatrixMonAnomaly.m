function [MTXAnomaly, newTimesRange] = calcMatrixMonAnomaly(VARIABLE, TimesRange, MonthNumber)

    MonthList = find(month(TimesRange) == MonthNumber);
    newTimesRange = TimesRange(MonthList);
    VARIABLE = squeeze(VARIABLE);
    newVARIABLE = VARIABLE(:, :, MonthList);
    
    MTXAnomaly = calcMatrixAnomaly(newVARIABLE);
    
end
