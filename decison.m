%ÅÐ¾öÆ÷
function sel=decison(x)
len=length(x);
sel=[];
for j=1:len
    if x(j)>=0
        sel=[sel 1];
    else
        sel=[sel 0];
    end
end