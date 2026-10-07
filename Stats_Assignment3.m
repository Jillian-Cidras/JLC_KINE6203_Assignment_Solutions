% Load the data from the NFL Combine and pro day data file
% using the read table tool.


% View a summary of the data in the table using the summary 
% function. 


% Calculate summary statistics for the timed variables in the
% database using appropriate functions. (Shuttle, 40, 3 cone)
summary(Shuttle)
summary(x40Yard)
summary(x3Cone)
% Create a histogram showing all three distributions for these
% timed variables. Make sure to label your figure and add a legend.
figure;
histogram(Shuttle, "Normalization", "pdf");
hold on;
histogram(x40Yard, "Normalization", "pdf");
histogram(x3Cone, "Normalization","pdf");
xlabel("Time (seconds)");
ylabel("Density");
title("Distributions of Timed Variables");
legend("Shuttle", "40-Yard Dash", "3-Cone");
hold off;

% Create a scatter plot in a new figure showing the relationship 
% between 40 yard dash performance and shuttle time).
figure;
scatter(x40Yard, Shuttle, "filled");
xlabel("40-Yard Dash Time (seconds)");
ylabel("Shuttle Time (seconds)");
title("40-Yard Dash vs. Shuttle Performance");
grid on;

% Calculate the correlation coefficient between these two variables.
correlationCoefficient = corr(x40Yard, Shuttle, "Rows", "complete");
disp("Correlation coefficient: " + correlationCoefficient);

% If your correlation coefficient indicates a strong relationship,
% fit a linear model to your data and calculate the coefficient of
% variation (r-squared). Plot your model on your scatterplot. 
if correlationCoefficient>.7
    linearModel = fitlm(x40Yard, Shuttle);
    rSquared = linearModel.Rsquared.Ordinary;
    xFit = linspace(min(x40Yard), max(x40Yard), 100)';
    yFit = predict(linearModel, xFit);
    plot(xFit, yFit, "r-", "LineWidth", 2);
    legend("Data", "Linear fit", "Location", "best");
end


% Run a t-test to determine if there is a difference in means between
% the 40 yard dash and the shuttle run. 
% Compare the mean times using a paired t-test for complete observations.
completeObservations = ~isnan(x40Yard) & ~isnan(Shuttle);%this is a filter for complete observations/NANs

[h, pValue, confidenceInterval, testStatistics] = ...  % this is running the paired t-test
    ttest(x40Yard(completeObservations), Shuttle(completeObservations));

disp("--- Paired t-Test Results ---");%I want a heading to display the results using disp and num2str(converts num to string)

disp("P-value: " + num2str(pValue, '%e')); % Using 'e' in num2str forces scientific notation so you don't just see 0
disp("T-statistic: " + testStatistics.tstat);
disp("Degrees of Freedom: " + testStatistics.df);

if h == 1   % this displays the final conclusion with an if statement
    disp("Conclusion: Reject the null hypothesis. There is a significant difference in means.");
else
    disp("Conclusion: Fail to reject the null hypothesis. There is no significant difference.");
end





