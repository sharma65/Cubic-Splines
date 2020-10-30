function B = NNCS(x,y)

n = size(x,2);

x2(n-2) = 0;
y2(n-2) = 0;

x2(1) = x(1);
y2(1) = y(1);
for i = 2:n-3
    x2(i) = x(i+1)
    y2(i) = y(i+1)
end
x2(n-2) = x(n);
y2(n-2) = y(n);

n = (size(x2,2));
A = zeros((n-1)*4);
Z((n-1)*4) = 0;

for i = 1 : 2*n - 2
    for j = 0 : 3
    	A(i, floor((i-1)/2)*4 + 4 - j) = x2(floor(i/2) + 1)^j;
    end
    Z(i) = y2(floor(i/2)+1);
end

for i = 2*n - 1 : 2 :  4*n - 6
    temp1 =  floor((i - 2*n + 5)/2);
    temp2 = (temp1 - 2)*4 + 1;
    A(i, temp2:temp2 + 7) = [3*x2(temp1)^2 2*x2(temp1) 1 0 -3*x2(temp1)^2 -2*x2(temp1) -1 0];
    A(i+1, temp2:temp2 + 7) = [6*x2(temp1) 2 0 0 -6*x2(temp1) -2 0 0];
end

A(4*n - 5, 1:4) = [x(2)^3 x(2)^2 x(2) 1];
A(4*n - 4, 4*n-7:4*n-4) = [x(end-1)^3 x(end-1)^2 x(end-1) 1];
Z(4*n-5) = y(2);
Z(4*n-4) = y(end-1);
tZ = transpose(Z);
B = inv(A)*tZ;

end

