function createfigure1(X1, Y1, S1, C1, X2)
%CREATEFIGURE1(X1, Y1, S1, C1, X2)
%  X1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  C1:  scatter c
%  X2:  vector of x data

%  Auto-generated by MATLAB on 16-Aug-2019 11:27:21

% Create figure
figure1 = figure('Color',[1 1 1]);
colormap(winter);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create scatter
scatter(X1,Y1,S1,C1,'MarkerFaceColor',[0 0 1],'MarkerEdgeColor',[0 0 1]);

% Create plot
plot(X2,X2,'LineWidth',4,'Color',[1 0 0]);

% Create ylabel
ylabel('Predicted N content(%)','FontWeight','bold','FontSize',18);

% Create xlabel
xlabel('Actual N content(%)','FontWeight','bold','FontSize',18);

% Create title
title(' ');

grid(axes1,'on');
% Set the remaining axes properties
set(axes1,'FontSize',16,'FontWeight','bold');
% Create textbox
annotation(figure1,'textbox',...
    [0.21637337826697 0.779376498800959 0.314188968921294 0.0957933300749718],...
    'String','R-Squared=60.21%(Spad)',...
    'FontWeight','bold',...
    'FontSize',16,...
    'FitBoxToText','off');

