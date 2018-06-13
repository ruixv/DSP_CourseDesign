function message=decode(x)
    N=length(x);
    message=[];
    temp=[];
    for i=1:7:N
        temp=x(i:i+6);
        a=num2str(temp);
        b=bin2dec(a);
        message=[message b];
    end
    message=char(message);