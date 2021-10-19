function figAnom = plotBinaryTSAnom(Dates, Serie, paramTitle, AxisLabelSize, TimeRef)

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
        
    figAnom = figure();
    hold on
    for iPt=1:length(Serie)
        if Serie(iPt) > 0
            plot([Dates(iPt),Dates(iPt)],[0,Serie(iPt)],'r-');
        elseif Serie(iPt) < 0
            plot([Dates(iPt),Dates(iPt)],[0,Serie(iPt)],'b-');
        end        
        
    end
    plot([min(Dates), max(Dates)], [0, 0], 'k-', 'LineWidth', 0.75);
    datetick('x','yyyy');

    grid on
    ylabel(paramTitle, 'fontsize', AxisLabelSize, 'FontName', 'Arial', 'fontweight', 'bold');
    xlabel('Time', 'fontsize', AxisLabelSize, 'FontName', 'Arial', 'fontweight', 'bold');
    xlim([min(Dates),max(Dates)]);
return

