function net=getMultiOutputNet(P,T)

net = feedforwardnet(30,'trainscg');
net = configure(net, P,T); 
net.trainParam.epochs =100;
net.trainParam.lr = 0.05;
%net.trainParam.lr_inc = 1.05;
net.trainParam.goal = 0.01 ;
net.trainParam.min_grad = 0.01;
net.performFcn = 'msereg';
net.performParam.ratio = 0.5;

[net] = train(net, P, T);