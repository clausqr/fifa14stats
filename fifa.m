


player=229397;  %messi=229397
round=255931;   %world cup
match=300186458; %ARG-NGA
[x,y,z_messi]=fifagetplayerheatmap(player, round, match, 'att');

player=209989;  %senderos
round=255931;   %world cup
match=300186514; %FRA-SUI
[x,y,z_senderos]=fifagetplayerheatmap(player, round, match, 'def');


player=196605;  %lichtsteiner
round=255931;   %world cup
match=300186514; %FRA-SUI
[x,y,z_lichtsteiner]=fifagetplayerheatmap(player, round, match, 'def');

player=311558;  %lang
round=255931;   %world cup
match=300186482; %HON-SUI
[x,y,z_xhaka]=fifagetplayerheatmap(player, round, match, 'def');




%%
clf
x_max=260;
y_max=392;



line([0 x_max x_max 0 0], [0 0 y_max y_max 0], 'Color', 'Black', 'LineWidth',3);
hold on
line([0 x_max], [y_max/2 y_max/2], 'Color', 'Black', 'LineWidth',3);
line([x_max*1/4 x_max*1/4 x_max*3/4 x_max*3/4], [0 y_max*1/6 y_max*1/6 0], 'Color', 'Black', 'LineWidth',3);
line([x_max*1/4 x_max*1/4 x_max*3/4 x_max*3/4], [y_max y_max*5/6 y_max*5/6 y_max], 'Color', 'Black', 'LineWidth',3);


plot(x_max, y_max, '.');
plot(0, y_max, '.');
plot(x_max, 0, '.');
plot(0,0, '.');
%axis vis3d
%axis([0 x_max 0 y_max 0 max(max(z_))]);
axis([-5 x_max+5 -5 y_max+5]);
%axis square;
%axis tight
%shading interp
%shading interpa

contourf(x, y, z_messi);
%%
pause
contour(x, y, z_senderos, 'LineWidth', 1.5);
pause
contour(x, y, z_lichtsteiner, 'LineWidth', 1.5);
%pause
%contour(x, y, z_xhaka);


