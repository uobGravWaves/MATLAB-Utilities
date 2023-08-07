function [hfig, ax] = qfig(hfig, ax)

picturewidth = 20; % set this parameter and keep it forever
hw_ratio = 0.65; % feel free to play with this ratio
set(findall(hfig,'-property','FontSize'),'FontSize',20) % adjust fontsize to your document
set(findall(hfig,'-property','Font'),'Font','arial')
set(findall(hfig,'-property','Box'),'Box','off') % optional
set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])
pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])

grid on
ax.Layer = "top";
ax.LineWidth = 1.7;
ax.TickDir = "out";
ax.YAxisLocation = "left";
ax.XAxisLocation = "bottom";
ax.Box = 'off';  
xline(ax.XLim(2),'-k', 'linewidth',ax.LineWidth);  
yline(ax.YLim(2),'-k', 'linewidth',ax.LineWidth);

ax.TitleFontSizeMultiplier = 2;
ax.Title.FontWeight = "bold";
ax.LabelFontSizeMultiplier = 1.5;
