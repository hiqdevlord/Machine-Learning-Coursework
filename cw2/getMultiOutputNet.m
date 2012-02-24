function net=getMultiOutputNet(P,T)

net = feedforwardnet([45],'trainbr');
net = configure(net, P,T); 
net.trainParam.epochs =100;
net.trainParam.lr = 0.05;
net.trainParam.goal = 0.01 ;
net.trainParam.min_grad = 0.01;
net.performFcn = 'msereg';
net.performParam.ratio = 0.5;
%net.layers{1}.transferFcn = 'tansig';
%net.layers{1}.learnFcn = 'learngdm';
%net.learnFcn='learngdm';
[net,tr] = train(net, P, T);
%plotperform(tr)