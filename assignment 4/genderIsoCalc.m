function [maleIsoIndMeans,femaleIsoIndMeans,maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)
%This function will calculate the means of the isometric testing individual 
%mean isometric strength values across all 3 days of lifting for the
% appropriate group. The second set of outputs will return the single mean 
% value for each group (mean of subject means).


%% Individual Means of Isometric Testing
male = strcmpi(string(Gender), 'M'); %makes gender into a string and then case in-sensitive
female = strcmpi(string(Gender), 'F');

combinedDays = [Day1, Day2, Day3]; %square brackets [] let you combine the three day vectors into columns of one matrix.

individualMeans= mean(combinedDays,2); % The 2 calculates the mean across each row.

maleIsoIndMeans = individualMeans(male); % Select individual means for male participants.
femaleIsoIndMeans = individualMeans(female); % Select individual means for female participants.

maleGroupIsoMean = mean(maleIsoIndMeans, 'omitnan');  % Calculate the mean of the male participants' individual means, ignoring NaN values.
femaleGroupIsoMean = mean(femaleIsoIndMeans, 'omitnan');  % Calculate the mean of the female participants' individual means, ignoring NaN values.
end


