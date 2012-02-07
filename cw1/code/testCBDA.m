function a=testCBDA(examples,target, emotion)

target(target~=emotion)=0;
target(target==emotion)=1;
attribs=[1:45];
a=chooseBestDA(attribs,examples,target);
best=0;
max=0;
for i=1:45
    same=0;
    for k=1:length(target)
        if examples(k,i)==target(k)
            same=same+1;
        end
    end
    if same>max
        max=same;
        best=i;
    end
    
end
best
end