
DataAll=Canolaallfinal(:,1:12);
%DataAll(:,12)=[];
Target=Canolaallfinal(:,13);

DataAll=zscore(DataAll);

IndRand=randperm(numel(Target));
DataAll=DataAll(IndRand,:);
Target=Target(IndRand);

%%
for i=1:20
    
 k=5;
 fun=@(Train,Target) fitrensemble(Train,Target);   %%anonymous function handle
 [cvMean_train,cvMean_test,y_pred,Mdl,y_true]=KfoldClass(k,DataAll,Target,fun);

 MSE(i)=cvMean_test.MSE;
end
%%

[a,i]=sort(MSE,'descend');

wv={'450nm'; '500nm'; '550nm'; '570nm' ;'600nm'; 
    '650nm' ; '610nm';'680nm';'730nm'; '760nm' ;'810nm';'860nm'};
wv=wv(i);
stem(a);
set(gca,'xtick',[1:12],'xticklabel',wv);
