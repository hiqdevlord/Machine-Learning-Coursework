function fa=fa_measure(a,pr, rc)
%Calculate the fa measure. In this case a=1 so we calculate the f1 measure.
%The results are returned in a vector
[~,sizerc]=size(pr);
fa=zeros(sizerc,1);
for i = 1: sizerc
if (a*pr(i)+rc(i))==0 
    fa(i) = 0;
else
    fa(i)=(1+a)*(((pr(i))*(rc(i)))/(a*pr(i)+rc(i)));
end
end