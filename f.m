function [ y ] = f( x )
    n=size(x);
    y=zeros(n);
    for i=1:n,
        y(i)=0.5+0.4*sin(2*x(i)*pi) + 0.05*x(i) + (0.05*randn());
    end
end

