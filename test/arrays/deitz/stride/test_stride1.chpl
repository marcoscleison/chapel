config var n: int = 8;

var D: domain(2) = [1..n, 1..n] by 2;

writeln(D);

var A: [D] int;

for i,j in D do
  A(i,j) = (i-1)*n + j-1;

writeln(A);
