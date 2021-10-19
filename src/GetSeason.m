function MonthNumbers = GetSeason(Season)

    switch (Season)
        case 'DJF'
            MonthNumbers = [12, 1, 2];
        case 'MAM'
            MonthNumbers = [3, 4, 5];
        case 'JJA'
            MonthNumbers = [6, 7, 8];
        case 'SON'
            MonthNumbers = [9, 10, 11];
        case 'JFM'
            MonthNumbers = [1, 2, 3];
        case 'AMJ'
            MonthNumbers = [4, 5, 6];
        case 'JAS'
            MonthNumbers = [7, 8, 9];
        case 'OND'
            MonthNumbers = [10, 11, 12];
    end

end