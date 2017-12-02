%In class 19
%GB comments
1A 100
1B 100
1C 100
2. 100
Overall 100


% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];

%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

control = mean(placebo);
treat1 = mean(treatment1);
treat2 = mean(treatment2);

std_control = std(placebo);
std_treat1 = std(treatment1);
std_treat2 = std(treatment2);

c = {'placebo'; 'treatment1'; 'treatment2'};
figure;
bar([control treat1 treat2]);
set(gca, 'xticklabel', c);
hold on;
errorbar([control treat1 treat2], [std_control, std_treat1, std_treat2], '.');

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

data_matrix = [placebo' treatment1' treatment2'];

[p, table, stats]  = anova1(data_matrix);
p
p =

    0.0029

% P-value indicates that there is at least one population mean that is
% statistically significant/different from one other population mean; the
% ANOVA test does not however, reveal which two groups share that
% relationship. 

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

multcompare(stats)

% From this function, it is evident that the mean of group 3 (treatment 2
% group) is significant from the means of group 1 and 2 (placebo and
% treatment 1 groups, respectively). 

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

data = load('data.mat');
xdat = [data.xdat]';
ydat = [data.ydat]';
ydat2 = [data.ydat2]';

% For pair (xdat, ydat):

    [coeff1, s1] = polyfit(xdat, ydat, 1);
    [coeff2, s2] = polyfit(xdat, ydat, 2);
    [coeff3, s3] = polyfit(xdat, ydat, 3);
    
    plot(xdat, ydat, 'r'); hold on;
    plot(xdat, polyval(coeff1, xdat), 'b'); hold on;
    plot(xdat, polyval(coeff2, xdat), 'g'); hold on;
    plot(xdat, polyval(coeff3, xdat), 'y'); 
    
    % The first, second, and third order polynomial fits seem to work well.
    % The best fit is probably the first order polynomial fit, considering
    % its coeff values
    
% For pair (xdat, ydat2); (Using polyfit/polyval functions): 

    [coeff1_2, s1_2] = polyfit(xdat, ydat2, 1);
    [coeff2_2, s2_2] = polyfit(xdat, ydat2, 2);
    [coeff3_2, s3_3] = polyfit(xdat, ydat2, 3);
    
    plot(xdat, ydat2, 'r'); hold on;
    plot(xdat, polyval(coeff1_2, xdat), 'b'); hold on;
    plot(xdat, polyval(coeff2_2, xdat), 'g'); hold on;
    plot(xdat, polyval(coeff3_2, xdat), 'y'); 
    
    % (Using fit funtion):
    fit_out1 = fit(xdat, ydat2, 'poly1');
    fit_out2 = fit(xdat, ydat2, 'poly2');
    fit_out3 = fit(xdat, ydat2, 'poly3');
    
    subplot(1,3,1);
    plot(fit_out1, xdat, ydat2, 'b'); 
    subplot(1,3,2);
    plot(fit_out2, xdat, ydat2, 'g');
    subplot(1,3,3);
    plot(fit_out3, xdat, ydat2, 'y'); 
    
    % The third order polynomial fits the data the best
