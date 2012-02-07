function [decision_tree]=decision_tree_learning(examples,attribs,targets)
if all(targets==1) || all(targets==0)
    decision_tree=struct('class',targets(1),'kids',[]);
    msg='SAME LABEL TRUE - LEAF NODE';
elseif isempty(attribs)
    decision_tree=struct('class',majority_value(targets),'kids',[]);
    msg='ATTRIBUTES EMPTY - LEAF NODE';
else
    msg='INTERNAL - ROOT NODE';
    best=chooseBestDA(attribs,examples,targets);
    tree.op=best;
    values=[0,1];
    [rows,cols]=size(examples);
    for u=1:2
        k=0;
        x1=[];
        y1=[];
        for i=1:rows
            if examples(i,best)==values(u)
                k=k+1;
                x1(k,:)=examples(i,:);
                y1(k)=targets(i);
            end
        end
        
        if isempty(x1)
            branch=struct('class',majority_value(targets),'kids',[]);
            msg='EMPTY X1'  
        else
            attribs(attribs==best)=[];
            branch=decision_tree_learning(x1,attribs,y1);
        end
        tree.kids{u}=branch;        
    end
    decision_tree=tree;
end

function maj_value=majority_value(targets)

if length(find(targets==1))>length(find(targets==0))
    maj_value=1;
else
    maj_value=0;
end