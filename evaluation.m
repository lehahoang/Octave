# This graph compares the difference between INT8 and INT16 respectively
pkg load statistics;
fault_rate={"1E-7","2E-7","4E-7","6E-7","8E-7",\
 "1E-6", "2E-6", "4E-6", "6E-6", "8E-6"}
# CAT-DNN
dat1=csvread("Unprotected_random_injection_mean_std_testset.csv",1,0)
dat2=csvread("Protected_random_injection_mean_std_testset.csv",1,0)
mean_u=dat1(:,3)
std_u=dat1(:,4)
mean_p=dat2(:,3)
std_p=dat2(:,4)


X=1E-7;
Y=72.8;
figure(1)
scatter(X,Y,"r","s","filled");
hold on;
errorbar(1:10, mean_p, std_p);
hold on;
errorbar(1:10, mean_u, std_u);
title ("Evaluation of CAT-DNN");
xlabel("Fault rate")
ylabel("Classification accuracy")
set(findobj(gca,'type','line'),'linewidth',3);
set(gca (), "xtick", [1 2 3 4 5 6 7 8 9 10 ], "xticklabel",fault_rate,\
"linewidth", 2, 'GridLineStyle','--', "fontsize", 14);
legend("Baseline accuracy", "CAT-DNN","DNN")
grid on;
