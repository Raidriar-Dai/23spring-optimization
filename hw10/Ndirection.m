function d=Ndirection(m,n,A,b,g,x)
e = ones(m,1);
p = 1 ./ (1+exp(-b.*(A*x)));
I = eye(n,n);
D1 = spdiags(p,[0],m,m);
D2 = spdiags(e-p,[0],m,m);
H = 1/m * A'*(D1*D2)*A + 1/(50*m)*I;
d = -inv(H)*g;
