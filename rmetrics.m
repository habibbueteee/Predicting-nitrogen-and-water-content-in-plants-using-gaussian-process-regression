function [RMSE,MSE,MAE,r2]=rmetrics(y_pred,y_true)


RMSE = sqrt(mean((y_true - y_pred).^2));
MSE=mean((y_true - y_pred).^2);
MAE=mean(abs(y_true - y_pred));

er_sqr=sum((y_true-y_pred).^2);
ss_tot=sum(((y_true-mean(y_true)).^2));

r2=100*(1-(er_sqr/ss_tot));


end