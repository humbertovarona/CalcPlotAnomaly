function MTXAnomaly = calcMatrixAnomaly(VARIABLE)

  VARIABLE = squeeze(VARIABLE);
  TMEAN = mean(VARIABLE, 3, 'omitnan');
  [nLONS, nLATS, nTIMES] = size(VARIABLE);
  
  for iTimes=1:nTIMES
      MTXAnomaly(:,:,iTimes) = VARIABLE(:,:,iTimes) - TMEAN;
  end
  

return
