function  y=conv(x,h)
y=zeros(1,length(h)+length(x)-1);
  for i=1:length(h)
    for j=1:length(x)
        y(i+j-1)=h(i)*x(j)+y(i+j-1);
    end
  end
end