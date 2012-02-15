function Tnew=getOutputsFor(T,label)
[~, T_cols]=size(T);
Tnew=zeros(1,T_cols);

for i=1:T_cols
    for k=1:6
        if T(k,i)==1
            if k==label
                Tnew(i)=1;
            end
        end
    end
end