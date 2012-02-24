function y = testANN(net, x,whichnet)
if whichnet==0
    out = sim( net, x);
    y=NNout2labels(out);
else
    y=testNets(net, x);
    
end
end