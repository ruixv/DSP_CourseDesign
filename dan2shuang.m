function y=dan2shuang(x)
N=length(x);
y=[];
for i=1:N
    if x(i)==1
        y=[y 1];
    else
        y=[y -1];
    end
end