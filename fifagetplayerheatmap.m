function [x_, y_, z_] = fifagetplayerheatmap(player,round,match,role)


%load('messi-NGA.dat');



dataurl=['http://lup.fifa.com/live/common/competitions/worldcup/round='...
            num2str(round)...
         '/match='...
            num2str(match)...
         '/statistics/player='...
            num2str(player)...
         '/player.js'];

%defensor suizo
%dataurl='http://lup.fifa.com/live/common/competitions/worldcup/round=255931/match=300186514/statistics/player=209989/player.js';

disp(['Retrieving data for player ' num2str(player)]);
datafromurl=urlread(dataurl);
disp(['OK']);
splitjson=strsplit(datafromurl, '(');
datajson=splitjson{2};
splitjson=strsplit(datajson, ')');
datajson=splitjson{1};
A=loadjson(datajson);
%%
a=A.playerHeatmap.heatmap.data;

n=size(a);

for i = 1:n(2)
    x(i)=a{i}.x;
    y(i)=a{i}.y;
    z(i)=a{i}.count;
end
x_max=260;
y_max=392;

if strcmp(role, 'def')
    y=y_max-y; %dar vuelta para defensa
end

smooth=10;

[x_, y_]=meshgrid(linspace(0,x_max,x_max/smooth), linspace(0,y_max,y_max/smooth));

z_=griddata(x,y,z,x_,y_);
