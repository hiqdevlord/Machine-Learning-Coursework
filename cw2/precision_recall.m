function [pr,rc]=precision_recall(cm)

for i=1:length(cm)
    
    pr(i)=(cm(i,i)+eps)/(sum(cm(:,i))+eps);
    
    rc(i)=(cm(i,i)+eps)/(sum(cm(i,:))+eps);

end