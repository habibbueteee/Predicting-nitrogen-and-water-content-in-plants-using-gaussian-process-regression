function pfinal=FeatureSelecion(Data)
[~,p1] = ttest(Data);
selectedind=p1<=0.04;
for i=1:size(Data,2)
   [~,p2(i)] = chi2gof(double(Data(:,i))); 
    if isnan(p2(i))
       p2(i)=1; 
    end
end

pfinal=p2 & selectedind;
end