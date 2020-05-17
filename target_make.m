w=Nitrogen;
wc=[];
for i=1:size(w)
    wc=[wc ; repmat(w(i),21,1)];
end
%%
soybean_wc=[DataAll wc];


%%
a=All_k_1(1:120,:);
b=[];
for i=1:3:length(a(:,1))
   
    at=mean(a(i:i+2,:));
    b=[b ; at];
    
    
end