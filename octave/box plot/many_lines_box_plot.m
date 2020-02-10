pkg load statistics;
# Loading data to plot the error plot
mul=csvread("20fm.csv",1,0)
mean=mul(:,1)
std=mul(:,2)
# Loading data to plot the box plot
da=csvread("20fm_box.csv",1,1)

#Loading data to plot clean case, faulty run, and single training
data = csvread("data.csv",1 ,0)
fm = data(:,1)
single = data(:,3)
faulty = data(:,4)
cleancase = data(1,5)

figure(1)
line([1 20],[cleancase cleancase], "linewidth",2 ,"linestyle",'--')
hold on;
plot(fm,faulty)
hold on;
plot(fm, single)
hold on;
boxplot({da(:,1), da(:,2), da(:,3), da(:,4), da(:,5),\
da(:,6), da(:,7), da(:,8), da(:,9), da(:,10),\
da(:,11), da(:,12), da(:,13), da(:,14), da(:,15),\
da(:,16), da(:,17), da(:,18), da(:,19), da(:,20)});

#errorbar(1:20, mean, std)
# We can use this to show the error bar plot
hold on
xlim([1 21])
ylim([75 100])
xlabel("Fault map ID", "FontSize", 20)
ylabel("Classification accuracy", "FontSize", 20)
set(findobj(gca,'type','line'),'linewidth',2);
set(gca,'FontSize',15)
legend("Case 1", "Case2 ",\
 "Case 3", "Case4 ",\
"location", "north")