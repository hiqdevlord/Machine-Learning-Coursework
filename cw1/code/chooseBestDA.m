function best=chooseBestDA(attribs,examples,targets)
pt=length(find(targets==1));
nt=length(find(targets==0));

for j=1:length(attribs),
    p1=0;p2=0;n1=0;n2=0;
    e=examples(:,attribs(j));
    e1=find(e==0);
    e2=find(e==1);
    
    for k=1:length(e1),
        if targets(e1(k))==1
            p1=p1+1;
        else
            n1=n1+1;
        end
    end
    for k=1:length(e2),
        if targets(e2(k))==1
            p2=p2+1;
        else
            n2=n2+1;
        end
    end
    rem(j)=(abs((p1+n1))/abs((pt+nt+eps)))*Info(p1,n1)+(abs((p2+n2))/abs((pt+nt+eps)))*Info(p2,n2);
    gain(j)=Info(pt,nt) - rem(j);
end

gain_max=gain(1);
best=1;
for j=2:length(attribs),
    if gain(j)>=gain_max
        gain_max=gain(j);
        best=attribs(j);
    end
end

end
function i=Info(p,n)
   i=((-p+eps)/(p+n+eps))*log2((p+eps)/(p+n+eps))-((n+eps)/(p+n+eps))*log2((n+eps)/(p+n+eps));
end

    