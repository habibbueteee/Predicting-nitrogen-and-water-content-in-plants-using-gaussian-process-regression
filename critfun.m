function r2 = critfun(X,Y)
% model = fitglm(X,Y,'Distribution','normal');
% dev = model.Deviance;


 k=5;
 fun=@(Train,Target) fitrtree(Train,Target);   %%anonymous function handle
 [cvMean_train,cvMean_test,y_pred,Mdl,y_true]=KfoldClass(k,X,Y,fun);
 
 r2=cvMean_test.r2;
 
end