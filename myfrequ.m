function H =myfrequ(h,x)

if ~exist('x','var')
    x=512;
end

H=zeros(1,x);
w=0;
for j=1:x
    for k=0:length(h)-1
        if(w==pi/2||w==pi)
            e=exp(-1i*sym(w)*k);
        else
            e=exp(-1i*w*k);
        end
    H(j)=H(j)+h(k+1)*e;
    end
 w=j*pi/x;
end

q=abs(H);
for m=1:x
    if(abs(q-1)<1e-15)
        q(m)=round(q(m));
    end
end

x=0:pi/(x-1):pi;

subplot(2,1,1);
plot(x/pi,20*log10(q));
xlabel('Normalized Frequency');
ylabel('Magnitude(dB)');
grid on;

subplot(2,1,2);
plot(x/pi,angle(H)*180/pi);
xlabel('Normalized Frequency');
ylabel('Phase(degrees)');
grid on;

end