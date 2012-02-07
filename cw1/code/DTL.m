function tree=DTL(examples,target, emotion)

target(target~=emotion)=0;
target(target==emotion)=1;
attribs=[1:45];

[tree]=decision_tree_learning(examples, attribs,target);


end

