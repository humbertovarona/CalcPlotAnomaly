function [TSAnomaly, newTimesRange] = CalcTSSeasAnomaly(TSVARIABLE, TimesRange, Season)

    MonthNumbers = GetSeason(Season);
    
    iSeas = 0;
    newTimesRange = [];
    for iMon=1:length(TimesRange) - 3
        if sum(eq(MonthNumbers,month(TimesRange(iMon:iMon+2)))) == 3
            iSeas = iSeas + 1;
            newTimesRange = [newTimesRange, TimesRange(iMon)];
            newVARIABLE(iSeas) = mean(TSVARIABLE(iMon:iMon+2), 'omitnan');
        end
    end

    TSAnomaly = CalcTSAnomaly(newVARIABLE);

return
