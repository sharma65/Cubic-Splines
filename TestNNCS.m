function TestNNCS(n)
dx = 0.001; maxX = 5; minX = -5;
X = minX:dx:maxX;
Y = 1./(1+X.^2);
t = round(length(X)/(n+1));
ind = t:t:n*t;
x = X(ind); y = Y(ind);
B = NNCS(x,y);
figure;
plot(X,Y,'--','linewidth',2);hold on; grid on;
plot(x,y,'go','linewidth',3);
xx = minX:dx:x(3);
b = B(1:4);
yy = 0;
for j = 1:4
    yy = b(j)*xx.^(4-j)+yy;
end
plot(xx,yy,'k-','linewidth',2);
for i = 3:length(x)-2
    xx = x(i):dx:x(i+1);
    b = B((i-2)*4+1:(i-1)*4);
    yy = 0;
    for j = 1:4
        yy = b(j)*xx.^(4-j)+yy;
    end
    plot(xx,yy,'k-','linewidth',2);
end
xx = x(end-2):dx:maxX;
b = B(end-3:end);
yy = 0;
for j = 1:4
    yy = b(j)*xx.^(4-j)+yy;
end
plot(xx,yy,'k-','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
set(gca,'xtick',min(X):1:max(X));
title(['NNCS: y = 1/(1+x^2) : n = ' num2str(n)]);
Y = spline(x,y,X);plot(X,Y,'r-.','linewidth',2);
%your curve should be idential to matlab own implementation.
end