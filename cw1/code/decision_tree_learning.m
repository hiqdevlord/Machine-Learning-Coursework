function [decision_tree]=decision_tree_learning(examples,attribs,targets)

if all(targets==1) || all(targets==0)
    decision_tree=struct('op',0,'class',targets(1),'kids',[]);
    msg='SAME LABEL TRUE'
elseif isempty(attribs)
    decision_tree=struct('op',0,'class',majority_value(targets),'kids',[]);
    msg='ATTRIBUTES EMPTY'
else
    msg='AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
    best=chooseBestDA(attribs,examples,targets);
    tree.op=best;
    tree.class=0;
    v=[0,1];
    [rows,cols]=size(examples);
    for u=1:2
        k=0;
        x1=[];
        y1=[];
        for i=1:rows
            if examples(i,best)==v(u)
                k=k+1;
                x1(k,:)=examples(i,:);
                y1(k)=targets(k);
            end
        end
        
        if isempty(x1)
            branch=struct('op',0,'class',majority_value(targets),'kids',[]);
            msg='EMPTY X1'  
        else
            atr=attribs;
            atr(atr==best)=[];
            branch=decision_tree_learning(x1,atr,y1);
        end
        tree.kids{u}=branch;        
    end
    decision_tree=tree;
end

end