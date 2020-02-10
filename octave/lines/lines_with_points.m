
pkg load statistics;

# Loading data from two csv files
dat1 = csvread("case1_compact.csv",1,0)
dat2 = csvread("case2_compact.csv",1,0)

mean_u = dat1(:,3)
mean_p = dat2(:,3)
FR = dat2(:,2)

figure(1)
X=max(FR);
Y=0.826;
scatter(X,Y,100,"r","*","filled"); # 100 is the size of the marker
hold on;
semilogx(FR, mean_p/100,'LineWidth', 3, 'Marker','s')
hold on;
semilogx(FR, mean_u/100,'LineWidth', 3, 'Marker','s')
hold on;
ylim ([0 1])
xlim ([min(FR) max(FR)])
xlabel("title")
ylabel("title")
set(gca (),'Fontsize',20);

legend("Clean case", "Case 1","Case 2", 'location', 'north')

