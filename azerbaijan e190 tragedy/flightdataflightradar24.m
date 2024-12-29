clear all;
data1 = csvread('sample.csv');
timestamp = data1(:,1);
speed = data1(:,8);
altitude = data1(:,7);
figure(1)
subplot(2,1,1) % 2 rows, 1 column, first position
plot(timestamp,speed);
title('Timestamp vs Speed')
xlabel 'Timestamp';
ylabel 'Speed';
subplot(2,1,2) % 2 rows, 1 column, second position
plot(timestamp,altitude);
title('Timestamp vs Altitude')
xlabel 'Timestamp';
ylabel 'Altitude';

