# This graph compares the difference between INT8 and INT16 respectively
pkg load statistics;
fm_num={"6", "7", "8", "9", "10"}
# CAT-DNN
#dat1=csvread("alexnet_Unprotected_random.csv",1,0)
#dat2=csvread("alexnet_Protected_random.csv",1,0)
dat1=csvread("fr3e-3.csv",1,0)


mean=dat1(:,3)
std=dat1(:,4)


figure(1)
line([1 5],[63.2 63.2], "linewidth",2 ,"linestyle",'--')
hold on;
line([1 5],[60.2 60.2], "linewidth",2 ,"linestyle",'--')
hold on;
errorbar(1:5, mean, std);
hold on;
xlim([1 5])
ylim([50 70])
xlabel("Number of fault maps", "FontSize", 20)
ylabel("Classification accuracy (%age)", "FontSize", 20)


set(findobj(gca,'type','line'),'linewidth',3);
set(gca (), "xtick", [1 2 3 4 5 ], "xticklabel",fm_num,\
"linewidth", 2, 'GridLineStyle','--', "fontsize", 20);
legend("Baseline accuracy", "Best accuracy of training policy", "Retrained network using FANTA","location", "north")
#legend("Protected DNNs","Unprotected DNN")
grid on;
