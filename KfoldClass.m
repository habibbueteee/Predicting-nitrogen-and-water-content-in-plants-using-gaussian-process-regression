function [cvMean_train,cvMean_test,Out,Mdl,true]=KfoldClass(k,Features_new,Target,fun)

%%initialization
Mdl={};Out=[]; Md1 = evalin('base','init');true=[];
RMSE=[]; MSE=[]; MAE=[]; er_sqr=[]; ss_tot=[]; r2=[];
%%
%%
%%
CVO = cvpartition(Target,'k',k);

%%loop for every fold
for i = 1:CVO.NumTestSets
    trIdx = CVO.training(i);
    teIdx = CVO.test(i);
    Mdl{i}=fun(Features_new(trIdx,:),Target(trIdx));
    
    ytrain_pred = predict(Md1{i},Features_new(trIdx,:));
    ytest_pred = predict(Md1{i},Features_new(teIdx,:));
    Out=[Out ; ytest_pred];
    
  
    ytest_true=Target(teIdx);
    
    true=[true ; ytest_true];
    ytrain_true=Target(trIdx);
    
    [RMSE_tr(i),MSE_tr(i),MAE_tr(i),r2_tr(i)]=rmetrics(ytrain_pred,ytrain_true);
    
    [RMSE_te(i),MSE_te(i),MAE_te(i),r2_te(i)]=rmetrics(ytest_pred,ytest_true);
    
     
end
cvMean_train.RMSE=mean(RMSE_tr);
cvMean_train.MSE=mean(MSE_tr);
cvMean_train.MAE=mean(MAE_tr);
cvMean_train.r2=mean(r2_tr);

cvMean_test.RMSE=mean(RMSE_te);
cvMean_test.MSE=mean(MSE_te);
cvMean_test.MAE=mean(MAE_te);
cvMean_test.r2=mean(r2_te);



end