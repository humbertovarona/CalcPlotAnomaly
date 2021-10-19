function TSAnomaly = CalcTSAnomaly(TS)

    TSMean = mean(TS, 'all', 'omitnan');
    TSAnomaly = TS - TSMean;

return
