%% How well does vehicle weight predict fuel economy?
% Dataset and source details are in README.md. Run the whole script.
folder = fileparts(mfilename('fullpath'));
cars = readtable(fullfile(folder, 'cars.csv'));

%% Fit the line on earlier model years
% Scaling weight makes the slope readable as MPG per additional 1,000 lb.
weight = cars.weight_lb / 1000;
mpg = cars.mpg;
train = cars.model_year < 1980;
test = ~train;
lineFit = polyfit(weight(train), mpg(train), 1);
predicted = polyval(lineFit, weight(test));

%% Check accuracy on cars from 1980 to 1982
% A positive residual means the car achieved more MPG than predicted.
residuals = mpg(test) - predicted;
mae = mean(abs(residuals));
baseline = mean(mpg(train));
baselineMAE = mean(abs(mpg(test) - baseline));

fprintf('Training cars: %d | Test cars: %d\n', sum(train), sum(test));
fprintf('Fitted MPG = %.2f %+.2f * weight in thousands of pounds\n', ...
    lineFit(2), lineFit(1));
fprintf('Mean absolute error: %.2f MPG (training-average baseline: %.2f)\n', ...
    mae, baselineMAE);
fprintf('Average actual minus predicted MPG: %+.2f\n', mean(residuals));

%% Plot the fitted relationship and inspect the test errors
figure('Name','Weight and fuel economy','Color','w');
subplot(2,1,1);
scatter(weight(train), mpg(train), 16, [0.26 0.44 0.65], 'filled');
hold on;
scatter(weight(test), mpg(test), 22, [0.80 0.34 0.12], 'd');
limits = [min(weight(train)), max(weight(train))];
plot(limits, polyval(lineFit, limits), 'k-', 'LineWidth', 1.6);
xlabel('Vehicle weight (1,000 lb)'); ylabel('Fuel economy (MPG)');
title('Heavier cars generally returned fewer miles per gallon');
legend('1970-79 training cars','1980-82 test cars','Training fit');
grid on;

subplot(2,1,2);
scatter(predicted, residuals, 24, [0.80 0.34 0.12], 'filled');
yline(0,'k--');
xlabel('Predicted fuel economy (MPG)'); ylabel('Actual minus predicted (MPG)');
title('How far off were predictions for later cars?');
grid on;
