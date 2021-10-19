function [TSAnomaly, newTimesRange] = CalcTSMonAnomaly(TSVARIABLE, TimesRange, MonthNumber)

    MonthList = find(month(TimesRange) == MonthNumber);
    newTimesRange = TimesRange(MonthList);
    newVARIABLE = TSVARIABLE(MonthList);

    TSAnomaly = CalcTSAnomaly(newVARIABLE);

return
