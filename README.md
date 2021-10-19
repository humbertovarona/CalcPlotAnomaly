# CalcPlotAnomaly: Matlab function set for the calculation and plotting of anomalies

[![DOI](https://zenodo.org/badge/418706594.svg)](https://zenodo.org/badge/latestdoi/418706594)

# Functions for the calculation of anomalies of complete time series, specifying the month and the season.

CalcTSAnomaly(TimeSerie)

CalcTSMonAnomaly(TimeSerie, Time, Month)

CalcTSSeasAnomaly(TimeSerie, Time, Season)

# Functions for the calculation of anomalies of complete 3D grids, specifying the month and the season.

calcMatrixAnomaly(Grid)

calcMatrixMonAnomaly(Grid, Time, Month)

calcMatrixSeasAnomaly(Grid, Time, Season)

The grids can be 3D, depending on Lon, Lat, and Time or 4D, depending on Lon, Lat, Depth, and Time. In the case of 4D grids, the depth must be preset, reducing it to a 3D grid.

# Functions for plotting anomalies

plotTSAnom

plotPointsTSAnom

plotAreaTSAnom

plotStairsTSAnom

plotBinaryTSAnom

plotBinaryBarTSAnom


# Functions for plotting anomalies at a location

plotTSAnomAtLocation

plotPointsTSAnomAtLocation

plotAreaTSAnomAtLocation

plotStairsTSAnomAtLocation

plotBinaryTSAnomAtLocation

plotBinaryBarTSAnomAtLocation

# Examples

lons = [-38.5, -38, -37.5, -37, -36.5, -36, -35.5];

nLONS = length(lons);

lats = [-1.5, -1, -0.5, 0, 0.5];

nLATS = length(lats);

depths = [1, 5, 10, 20, 30, 100];

nDEPTHS = length(depths);

timeRange = [datenum('2001-07-15'):30:datenum('2009-07-15')] - datenum('1900-01-01');

nTIMES = length(timeRange);


TEMPERATURE = zeros(nLONS, nLATS, nDEPTHS, nTIMES);


for iDepths=1:nDEPTHS

    TSTEMP(iTimes) = 25.0 + iTimes/2.0 * rand(1);

    for iTimes=1:nTIMES

        TEMPERATURE(:, :, iDepths, iTimes) = 25.0 + iTimes/2.0 * rand(7, 5) - depths(iDepths) * 0.2;

    end
end

createtimeserie_NC('testTSAnomaly.nc', timeRange, 'days since 1900-01-01')

inserttimeserie_NC('testTSAnomaly.nc', TSTEMP, 'ts_TEMP', 'tsTemp', 'Fake temperature (Time serie)', '°C')

TSAnomaly = CalcTSAnomaly(TSTEMP);

inserttimeserie_NC('testTSAnomaly.nc', TSAnomaly, 'ts_TEMP_anom', 'tsTemp', 'Fake temperature (Anomaly)', '°C')


figAnom = plotTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_Simple.jpeg');

figAnom = plotPointsTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_Points.jpeg');

figAnom = plotAreaTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_Area.jpeg');

figAnom = plotStairsTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_Stairs.jpeg');

figAnom = plotBinaryTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_Binary.jpeg');

figAnom = plotBinaryBarTSAnom(timeRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnomTS_BinaryBar.jpeg');



[TSAnomaly, newTimesRange] = CalcTSMonAnomaly(TSTEMP, timeRange, 7);

figAnom = plotBinaryTSAnom(newTimesRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');





[TSAnomaly, newTimesRange] =  CalcTSSeasAnomaly(TSTEMP, timeRange, 'SON');

figAnom = plotBinaryBarTSAnom(newTimesRange, TSAnomaly, 'Fake-temperature anomaly (\circC)');



TEMPERATURE(:,4,:,:) = NaN;

TEMPERATURE(6,:,:,:) = NaN;

TEMPERATURE(2,3,:,17) = NaN;


[LATS, LONS] = meshgrid(lats, lons);

create_NC_2DCoordinates('Matrix_Anomaly.nc', LONS, LATS);

inserttime_NC('Matrix_Anomaly.nc', timeRange, 'days since 1900-01-01');

insertdynamicvariable4D_NC('Matrix_Anomaly.nc', TEMPERATURE, 'temp', 'temperature', 'temperature', '°C', NaN);

MTXAnomaly = calcMatrixAnomaly(TEMPERATURE(:,:,3,:));

insertdynamicvariable3D_NC('Matrix_Anomaly.nc', MTXAnomaly, 'temp_anom', 'temperature anomaly', 'temperature anomaly at 3m depth', '°C', NaN);




figAnom = plotPointsTSAnomAtLocation([-37, -1], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_Points.jpeg');

figAnom = plotTSAnomAtLocation([-38, -1], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_Simple.jpeg');

figAnom = plotAreaTSAnomAtLocation([-38.5, -1], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_Area.jpeg');

figAnom = plotStairsTSAnomAtLocation([-38, 0], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_Stairs.jpeg');

figAnom = plotBinaryTSAnomAtLocation([-38.5, 0.5], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_Binary.jpeg');

figAnom = plotBinaryBarTSAnomAtLocation([-37.5, 0.5], timeRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

print(figAnom,'-djpeg','-r500','figAnom3mAtLocation_BinaryBar.jpeg');


[MTXAnomaly, newTimesRange] = calcMatrixMonAnomaly(TEMPERATURE(:,:,1,:), timeRange, 3);



[MTXAnomaly, newTimesRange] = calcMatrixSeasAnomaly(TEMPERATURE(:,:,6,:), timeRange, 'JJA');


figAnom = plotTSAnomAtLocation([-37, -1], newTimesRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

figAnom = plotBinaryTSAnomAtLocation([-38.5, 0.5], newTimesRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');

figAnom = plotBinaryBarTSAnomAtLocation([-37, -1], newTimesRange, MTXAnomaly, lons, lats, 'Fake-temperature anomaly (\circC)');


All functions for handling NetCDF files can be downloaded from:

https://zenodo.org/record/5572749#.YW4I_nnQ_Po
