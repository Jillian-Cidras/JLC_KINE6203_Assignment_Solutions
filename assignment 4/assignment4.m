%Jillian Cidras 
%assignment 4

%Import data
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv', [2, Inf]); %import function came from import data tool

% Calculate average isometric strength by gender
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender, Day1, Day2, Day3);

%Day 1 to Day 2 Comparison
day1toDay2 = dayComparer(SubjectID,Day1, Day2); 

% Day 2 to Day 3 Comparison
day2toDay3 = dayComparer(SubjectID, Day2, Day3);

% Normalize strength by body weight
normDay1 = Day1 ./ Weight; %The ./ means to divide each element by the element in the same position.
normDay2 = Day2 ./ Weight;  % all of these are the normalization of each day for all subjects
normDay3 = Day3 ./ Weight;

normDay1mean = mean(normDay1, 'omitnan'); %this is the mean per day
normDay2mean = mean(normDay2, 'omitnan');
normDay3mean = mean(normDay3, 'omitnan');

%export

numberOfRows = max([length(day1toDay2), length(day2toDay3), ...
    length(maleIsoIndMeans), length(femaleIsoIndMeans), 1]); %looks for the longest result so all columns have the same number of rows

%create empty columns filled with NaN
day1toDay2 = day1toDay2(:); %changes the results into a column
day2toDay3 = day2toDay3(:); 
maleIsoIndMeans = maleIsoIndMeans(:); %changes male means into a column
femaleIsoIndMeans = femaleIsoIndMeans(:); %changes female means into a column

day1toDay2(end+1:numberOfRows, 1) = NaN; %adds NaN to make the column the right length
day2toDay3(end+1:numberOfRows, 1) = NaN; 
maleIsoIndMeans(end+1:numberOfRows, 1) = NaN; 
femaleIsoIndMeans(end+1:numberOfRows, 1) = NaN; 

%put the means in the first row so they do not repeat
normDay1mean = [normDay1mean; NaN(numberOfRows-1, 1)]; %adds NaN below the mean so the column has the right length
normDay2mean = [normDay2mean; NaN(numberOfRows-1, 1)]; %numberOfRows-1 tells matlab how many NaN values to create
normDay3mean = [normDay3mean; NaN(numberOfRows-1, 1)]; %minus one bc of fist row incluing the mean
maleGroupIsoMean = [maleGroupIsoMean; NaN(numberOfRows-1, 1)];
femaleGroupIsoMean = [femaleGroupIsoMean; NaN(numberOfRows-1, 1)];

%put all results into one table
resultsTable = table(normDay1mean, normDay2mean, normDay3mean, ...
    day1toDay2, day2toDay3, maleIsoIndMeans, femaleIsoIndMeans, ...
    maleGroupIsoMean, femaleGroupIsoMean);

%FINALLY!!!! export the table to a CSV file
writetable(resultsTable, 'iso_results.csv');