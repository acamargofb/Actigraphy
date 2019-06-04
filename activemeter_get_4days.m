function [t_0, y_2, y_3, y_4, y_5] = activemeter_get_4days(acti, init_data_time)
% This function gets an stack of activemeter data per day
% the time for every day starts at zero

resolution = 1;



%init_data_time = int_start_hour*60 + int_start_min;

day_t4 = 4*24*60;

tt_4 = 1:resolution:day_t4;
yy_4 = acti(1:resolution:day_t4);

% figure,
% subplot(3,2,1); plot(tt_4, yy_4);  title('Day 1 to Day 4');
% ylim([0 2000])

% day 1%
% considering that all the values start on different hours and mins

day_1 = (24*60*1 -  init_data_time ) + 1;

t_1 = 1:resolution:day_1;
y_1 = acti(1:resolution:day_1);

t_0 = 0:resolution:1439;

%subplot(3,2,2); plot(t_1, y_1);  title('Day 1');
% ylim([0 2000])
% 


% day 2 %

day_2 = (24*60*2 -  init_data_time ) + 1;

t_2 = (day_1 + 1):resolution:day_2;
y_2 = acti(day_1 + 1:resolution:day_2);


% subplot(3,2,3); plot(t_2, y_2);  title('Day 2');
% ylim([0 2000])

% subplot(3,2,3); plot(t_0, y_2);  title('Day 2');
% ylim([0 2000])

% day and night



% plotting the day and night information
% t2_morning = (day_1 + 1):resolution:(day_2 - 12*60);
% t2_night =  t2_morning:resolution:day_2;



% day 3 %

day_3 = (24*60*3 -  init_data_time ) + 1;

t_3 = (day_2 + 1):resolution:day_3;
y_3 = acti(day_2 + 1:resolution:day_3);


%subplot(3,2,4); plot(t_3, y_3);  title('Day 3');
%ylim([0 2000])

% subplot(3,2,4); plot(t_0, y_3);  title('Day 3');ylim([0 2000]);



% plotting the day and night information
% 
% t2_morning = 


% day 4 %

day_4 = (24*60*4 -  init_data_time ) + 1;

t_4 = (day_3 + 1):resolution:day_4;
y_4 = acti(day_3 + 1:resolution:day_4);


%subplot(3,2,5); plot(t_4, y_4);  title('Day 4');
%ylim([0 2000])
% subplot(3,2,5); plot(t_0, y_4);  title('Day 4');ylim([0 2000]);

% day 5 %

day_5 = (24*60*5 -  init_data_time ) + 1;

t_5 = (day_4 + 1):resolution:day_5;
y_5 = acti(day_4 + 1:resolution:day_5);

% subplot(3,2,6); plot(t_5, y_5);  title('Day 5');
% ylim([0 2000])
%subplot(3,2,6); plot(t_0, y_5);  title('Day 5');ylim([0 2000]);

% 
% % day 6 %
% 
% day_6 = (24*60*6 -  init_data_time ) + 1;
% 
% t_6 = (day_5 + 1):resolution:day_6;
% y_6 = acti(day_5 + 1:resolution:day_6);