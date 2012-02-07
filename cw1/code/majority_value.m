function maj_value=majority_value(targets)
aces=0;
zeros_num=0;
for i=1:length(targets),
    if targets(i)==0
        zeros_num=zeros_num+1;
    else
        aces=aces+1;
    end
end

if zeros_num>aces
    maj_value=0;
else
    maj_value=1;
end


end