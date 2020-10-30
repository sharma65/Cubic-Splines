function B = NCS(x,y)

n = (size(x,2));
A = zeros((n-1)*4);
Z((n-1)*4) = 0;

for i = 1 : 2*n - 2
    for j = 0 : 3
    	A(i, floor((i-1)/2)*4 + 4 - j) = x(floor(i/2) + 1)^j;
    end
    Z(i) = y(floor(i/2)+1);
end

for i = 2*n - 1 : 2 :  4*n - 6
    temp1 =  floor((i - 2*n + 5)/2);
    temp2 = (temp1 - 2)*4 + 1;
    A(i, temp2:temp2 + 7) = [3*x(temp1)^2 2*x(temp1) 1 0 -3*x(temp1)^2 -2*x(temp1) -1 0];
    A(i+1, temp2:temp2 + 7) = [6*x(temp1) 2 0 0 -6*x(temp1) -2 0 0];
end

A(4*n - 5, 1:2) = [6*x(1) 2];
A(4*n - 4, 4*n-7:4*n-6) = [6*x(n) 2];
tZ = transpose(Z);
B = inv(A)*tZ;

end

