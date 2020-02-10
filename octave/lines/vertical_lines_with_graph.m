# This script plots the evolution of the algorithm used
# to search for the optimal threshold of the conv5.weight
pkg load statistics;

FILE = 'data_vertical_lines_with_graph.csv'
x=csvread(FILE,1,0) # Skipping the first row
[row, col] = size(x)
#xmax=x(1,1)
#xmin=x(row,1)
#th=x(3:18,1)
#auc = x(3:18,2)
th=x(1:20,1)
auc = x(1:20,2)

ymax = max(auc) 
ymin = min(auc)
xmin = min(th)
xmax = max(th)
#First Iteration 
#x_t0 = 0.5 ; y_t0 = 0.0999
#x_t1 = 2.6962 ; y_t1 = 0.6470
#x_t2 = 5.3923 ; y_t2 = 0.6768
#x_t3 = 8.0885 ; y_t3 = ymax+0.002

#Second Iteration 
x_t0 = 2.6962; y_t0 = ymax+0.002
x_t1 = 4.4936 ; y_t1 = ymax+0.002
x_t2 = 6.291; y_t2 = ymax+0.002
x_t3 = 8.0885 ; y_t3 = ymax+0.002


#Third Iteration 
#x_t0 = 4.4936; y_t0 = ymax+0.002
#x_t1 = 5.6919 ; y_t1 = 0.676781134	
#x_t2 = 6.8902 ; y_t2 = 0.676751724	
#x_t3 = 8.0885 ; y_t3 = ymax+0.002


# Fourth Iteration 
#x_t0 = 4.4936; y_t0 = 0.673798384
#x_t1 = 5.2925 ; y_t1 = 0.676483872
#x_t2 = 6.0913 ; y_t2 = 0.677529074
#x_t3 = 6.8902 ; y_t3 = 0.676751724


figure(1)
plot(th, auc,'LineWidth', 5, 'Marker','s',  'color', 'b' )
ylabel ("title", "fontsize", 50);
xlabel ("title","fontsize", 50)
set(gca, "Fontsize", 28)
#xlim ([xmin xmax]);
#ylim ([0 ymax])
xlim ([xmin xmax])
#ylim ([0.66 ymax+0.01])
ylim ([0.63 ymax+0.002]) #for the second iteration
#grid on;
hold on;

plot([x_t0 x_t0] ,[0 y_t0], "linewidth",3 , "color", "r")
hold on;
plot([x_t1 x_t1] ,[0 y_t1], "linewidth",3 , "color", "r")
hold on;
plot([x_t2 x_t2] ,[0 y_t2], "linewidth",3 , "color", "r")
hold on;
plot([x_t3 x_t3] ,[0 y_t3], "linewidth",3 , "color", "r")
hold on;

#legend("1st iteration", "location", "southeast")
#legend("2nd iteration", "location", "southeast")
#legend("3rd iteration", "location", "southeast")
#legend("4th iteration", "location", "southeast")
#plot([xmin xmax] ,[baseline baseline], "linestyle", "--", "color", "b")
#legend("Evolution of AUC", "AUC without threshold")
#plot([xmin xmax] ,[yline yline], "linewidth", 3,"color", "r")
#hold on;
