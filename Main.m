clc
clear
close
%% load data
%[DataAll_wheat]=LoadData();
load corn_k1_wn


%%
DataAll=Canolaallfinal(:,1:12);
Target=Canolaallfinal(:,13);
%%
% X=DataAll;
% [DataAll]=msc(X,1,size(X,2)); 


%% FeatureSelection
pfinal=FeatureSelecion(DataAll);
Features_new=DataAll(:,pfinal);
%%
DataAll=zscore(DataAll);
%% Shuffle
IndRand=randperm(numel(Target));
DataAll=DataAll(IndRand,:);
Target=Target(IndRand);
%final=[DataAll Target];
%%
y_pred_train=[]; y_true_train=[]; y_pred_test=[]; y_true_test=[];
for i=1:20

[trainInd,testInd] = dividerand(length(Target),0.8,0.2);
DataAll_train=DataAll(trainInd,:);
DataAll_test=DataAll(testInd,:);
Target_train=Target(trainInd);
Target_test=Target(testInd);
%final_train=[DataAll_train Target_train];

%%
 k=5;
 fun=@(Train,Target) fitrgp(Train,Target,'kernelFunction','rationalquadratic');   %%anonymous function handle
 [cvMean_train,cvMean_test,y_pred,Mdl,y_true]=KfoldClass(k,DataAll,Target,fun);
cvMean_test

%%
 y1pred = predict(cornwcmdl,DataAll_train);
 y2pred = predict(wheatwcmdl,DataAll_train);
 y3pred = predict(soybeanwcmdl,DataAll_train);
 y4pred = predict(canolawcmdl,DataAll_train);
 yprednew=[y1pred y2pred y3pred y4pred];
 enall_train=[yprednew Target_train];
 
 y1pred_test = predict(cornwcmdl,DataAll_test);
 y2pred_test = predict(wheatwcmdl,DataAll_test);
 y3pred_test = predict(soybeanwcmdl,DataAll_test);
 y4pred_test = predict(canolawcmdl,DataAll_test);
 yprednew_test=[y1pred_test y2pred_test y3pred_test y4pred_test];
 
 enall_test=[yprednew_test Target_test]; 
 %%
 k=5;
 
 enall_train_feature=enall_train(:,1:4);
 enall_train_target=enall_train(:,4);
 
 IndRand=randperm(numel(enall_train_target));
 enall_train_feature=enall_train_feature(IndRand,:);
 enall_train_target=enall_train_target(IndRand);
 
 fun=@(Train,Target) fitrgp(Train,Target,'kernelFunction','rationalquadratic'); %%anonymous function handle
 
 [cvMean_train,cvMean_test,y_pred,Mdl,y_true]=KfoldClass(k,enall_train_feature,enall_train_target,fun);
 
 cvMean_test
 
 ypredtest=predict(Mdl{3},enall_test(:,1:4));
 
 [RMSE,MSE,MAE,r2]=rmetrics(ypredtest,Target_test)
 
 
 
 %%
% Prediction
y_pred_train_temp = predict(Mdl{4},DataAll);
% y_pred_train_temp = trainedModel_N10.predictFcn(DataAll_train);
% y_pred_train=[y_pred_train ; y_pred_train_temp];

y_true_train_temp=Target;
% y_true_train=[y_true_train ; y_true_train_temp];

% y_pred_test_temp =  trainedModel_N10.predictFcn(DataAll_test);
% y_pred_test=[y_pred_test ; y_pred_test_temp];
% 
% y_true_test_temp=Target_test;
% y_true_test=[y_true_test ; y_true_test_temp];

[RMSE_tr,MSE_tr,MAE_tr,r2_tr]=rmetrics(y_pred_train_temp,y_true_train_temp);
% [RMSE_te(i),MSE_te(i),MAE_te(i),r2_te(i)]=rmetrics(y_pred_test_temp,y_true_test_temp);


end
display('done')
%%
%Predicted vs actual plot 
x=2:8/120:12;
createfigure(y_true_train_temp,y_pred_train_temp,'blue','filled',x)
grid on
%% N distribution
gscatter(1:42,Nitrogen,group)
xlabel('Leaf sample number ')
ylabel('Nitrogen contents(%)')
title('N contents among the leaves of four species of plants')

%%
Md1

%%
%%sequencials feature selection
  
opt = statset('display','iter');
                

inmodel = sequentialfs(@critfun,X,Y,...
                       'cv','none',...
                       'nullmodel',false,...
                       'nfeatures',12,...
                       'direction','forward',...
                        'options',opt);



