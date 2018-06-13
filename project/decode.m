function message=decode(x)
    whos x
    N=length(x)
    message=[];
    temp=[];
    for i=1:7:N
        i
        temp=x(i:i+6);
        a=num2str(temp);
        b=bin2dec(a);
        message=[message b];
    end
    message=char(message);