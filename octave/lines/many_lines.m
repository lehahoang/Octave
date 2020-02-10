# Reading data from data.csv file
data = csvread("data.csv",1 ,0)
mean=[88.235,	87.7,	88.6655,	88.1455,	88.402]
std=[1.353877472,	1.120234938,	1.398839651,	1.084156111,	1.213119511]
fm = data(1:5,1)
single = data(1:5,3)
faulty = data(1:5,4)
cleancase = data(1,5)
figure(1)
line([1 5],[cleancase cleancase], "linewidth",2 ,"linestyle",'--')
hold on;
plot(fm,faulty)
hold on;
plot(fm, single)
hold on;
errorbar(1:5, mean, std)
hold on;
xlim([1 5.1])
ylim([75 100])
xlabel("Title", "FontSize", 20)
ylabel("Title", "FontSize", 20)
set(findobj(gca,'type','line'),'linewidth',2);
set(gca,'FontSize',15)
legend("Case 1", "Case2 ",\
 "Case 3", "Case4 ",\
"location", "north")