# This script plots the evolution of the algorithm used
# to search for the optimal threshold of the conv5.weight
pkg load statistics;
#FILE='conv5.weight_th_acc_auc_max.csv';
#FILE='conv5.weight_th_acc_auc_large_init.csv';
FILE='conv5.weight_th_acc_auc_small.csv';
x=csvread(FILE,1,0) # Skipping the first row
[row, col] = size(x)
th=x(:,1)
auc = x(:,2)
accuracy = x(:,3)
X1 = x(row,1) #Optimal threshold 
X2 = x(1,1) # Initial threshold
Y1 = x(1,4)+10 # Baseline AUC
Y2 = x(1,5) # Baseline Accuracy

h_ax={"12.7636",\
"11.4872",\
"10.3385",\
"9.3047",\
"8.3742",\
"8.2905",\
"8.2822",\
"8.2813"}
 
figure(1)
scatter(X2,0,80,"b","c","filled"); # Initial threshold
hold on;
scatter(X1,Y1,80,"b","s","filled"); # AUC
hold on;
scatter(X2,Y2-0.01*Y2,80,"r","s","filled"); # Accuracy
hold on;
[ax, h1, h2] = plotyy (th, auc, th, accuracy, 'plot', 'plot');
ylabel (ax(1), "Area Under the Curve",  'color', 'b');
ylabel (ax(2), "ACCURACY",  'color', 'r' );
set(h1, 'LineWidth', 2, 'Marker','o','linestyle','--',  'color', 'b');
set(h2, 'LineWidth', 2, 'Marker','o','linestyle','--', 'color', 'r');
set(ax, "fontsize", 14 )
set(ax(1), 'ycolor' , 'b')
set(ax(2), 'ycolor' , 'r')
title ("Algorithm running","fontsize", 20);
xlabel(ax(1),"Threshold", "fontsize", 20)

legend("Initial threshold","Baseline AUC+10", "1% from Baseline Accuracy", "CAT-DNN","DNN",\
'location','southeast')
grid on;

figure(2)

subplot(2,1,1)
scatter(X2,0,80,"b","c","filled"); # Initial threshold
hold on;
h1=plot(th, auc)
set(h1, 'LineWidth', 2, 'Marker','o','linestyle','--');
xlabel("Threshold")
ylabel("Area Under the Curve")
hold on;
scatter(X1,Y1,"r","s","filled");
legend("Initial Threshold","AUC", "Baseline AUC+10",'location','southeast')
grid on;

subplot(2,1,2)
scatter(X2,0,80,"b","c","filled"); # AUC
hold on;
h2=plot(th, accuracy)
set(h2, 'LineWidth', 2, 'Marker','o','linestyle','--');
xlabel("Threshold")
ylabel("Classification accuracy")
hold on;
scatter(X2,Y2-Y2*0.01,"r","s","filled");
legend("Initial Threshold","Baseline accuracy", "1% Baseline accuracy",'location','southeast')
grid on;