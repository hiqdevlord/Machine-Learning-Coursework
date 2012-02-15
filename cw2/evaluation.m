function [cm,avg_error]=evaluation(examples,targets,whichnet)

N=10; %N-Cross Validation
c=1;sum=0;
[examples_no, columns]=size(examples);
actual=[];
predicted=[];
figure;

%set(hleg1, 'Position', [.1,.2,.1,.2]);
set (0,'DefaultAxesColorOrder',[0 0 0;0 1 0;0 0 1;1 1 0;0 1 1;1 0 1; 1 0 0;0.5 0.5 1;1 0.2 0.1;0.2 0.5 0.8]);
%'DefaultAxesLineStyleOrder','-|-.|--|:'
%The examples matrix is split test_data and train_data which correspond to
%the 10% and 90% accordingly.
for i=1:examples_no/N:examples_no
    %Compute test data (10 rows)
    test_data=examples(i:i+N-1,:);
    test_targets=targets(i:i+N-1);
    %Compute train data (90 rows)
    train_data=examples;
    train_data(i:i+N-1,:)=[];
    %Compute train target (90 rows)
    train_target=targets;
    train_target(i:i+N-1)=[];
    
    %Retrieve the nets for every emotion
    [P,T]=ANNdata(train_data,train_target);
    
    if whichnet==0
        net=getMultiOutputNet(P,T);
        y=testANN(net,test_data',whichnet);
    else
        nets=getSingleOutputNets(P,T);
        %Returns the vector containing all the predicted values for the
        %specific test data
        test_data'
        y=testANN(nets,test_data,whichnet);
    end

    %For every value that is not classified and therefore it returns zero
    %we set it to the value that appears the most in this specific vector.
    y(y==0)=mode(test_targets);
    
    %Create an overall predicted labels vector by concatenating with each y
    %vector returned.
    predicted=[predicted y'];
    %Create an overall actual labels vector by concatenating with each test
    %target vectory
    actual=[actual test_targets'];
    cm_per_fold=conf_matrix(test_targets', y');
    [pr,rc]=precision_recall(cm_per_fold);
    [f]=fa_measure(1,pr,rc)
    plot(f,'LineWidth',2,'LineStyle','--');
    hold all;
    %Estimate the error for the current subset by comparing it with the
    %actual label vector
    e(c)=0;
    for j=1:N
        if y(j)~=test_targets(j)
            e(c)=e(c)+1;
        end
    end
    e(c)=e(c)/N;
    
    %Sum up all the 10 errors in order to compute the avg error later
    sum=sum+e(c);
    c=c+1;
end
legend('1-fold','2-fold','3-fold','4-fold','5-fold','6-fold','7-fold','8-fold','9-fold','10-fold');
%Compute the total error and the confusion matrix
avg_error=(1/N)*sum;
cm=conf_matrix(actual, predicted);
%[pr,rc]=precision_recall(cm);
%[f]=fa_measure(1,pr,rc)
%Xaxis=[0:0.01:1];
%plot(Xaxis,f);
legend('1-fold','2-fold','3-fold','4-fold','5-fold','6-fold','7-fold','8-fold','9-fold','10-fold');

end
    