function figAnom = plotAreaTSAnomAtLocation(Location, Dates, MTXAnomaly, LONS, LATS, paramTitle, AxisLabelSize, TimeRef)

    if exist('paramTitle', 'var') == 0
        paramTitle = '';
    end
    if exist('TitSize', 'var') == 0
        AxisLabelSize = 14;
    end
    if exist('TimeRef', 'var') == 0
        TimeRef = '1900-01-01';
        Dates = Dates + datenum(TimeRef);
    end
    
    iSerie = find(LONS == Location(1));
    jSerie = find(LATS == Location(2));
    
    Serie = squeeze(MTXAnomaly(iSerie, jSerie, :))';
    figAnom = figure();
    area(Dates, Serie,'FaceColor',[0.3010 0.7450 0.9330],'EdgeColor',[0 0.4470 0.7410]);

    hold on
    plot([min(Dates), max(Dates)], [0, 0], 'k-', 'LineWidth', 0.75);
    
    
    datetick('x','yyyy');

    grid on
    ylabel(paramTitle, 'fontsize', AxisLabelSize, 'FontName', 'Arial', 'fontweight', 'bold');
    xlabel('Time', 'fontsize', AxisLabelSize, 'FontName', 'Arial', 'fontweight', 'bold');
    xlim([min(Dates),max(Dates)]);
return

