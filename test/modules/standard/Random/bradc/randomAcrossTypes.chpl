use Random;

config param useNPB = true;
config param rtype = if useNPB then RNG.NPB else RNG.PCG;

var A: [1..8] real;
var B: [1..8] imag;
var C: [1..4] complex;

//
// Check standalone routines
//
fillRandom(A, seed=314159265, algorithm=rtype);
fillRandom(B, seed=314159265, algorithm=rtype);
fillRandom(C, seed=314159265, algorithm=rtype);
writeln(A);
writeln(B);
writeln(C);

var rs1 = makeRandomStream(seed=314159265, eltType=real, algorithm=rtype);
var rs2 = makeRandomStream(seed=314159265, eltType=imag, algorithm=rtype);
var rs3 = makeRandomStream(seed=314159265, eltType=complex, algorithm=rtype);

//
// Check fillRandom method
//
rs1.fillRandom(A);
rs2.fillRandom(B);
rs3.fillRandom(C);
writeln(A);
writeln(B);
writeln(C);

var rs4 = makeRandomStream(seed=314159265, eltType=real, algorithm=rtype);
var rs5 = makeRandomStream(seed=314159265, eltType=imag, algorithm=rtype);
var rs6 = makeRandomStream(seed=314159265, eltType=complex, algorithm=rtype);

//
// Check consecutive implementations of fillRandom method()
//
rs4.fillRandom(A[1..4]);
rs5.fillRandom(B[1..4]);
rs6.fillRandom(C[1..2]);
rs4.fillRandom(A[5..8]);
rs5.fillRandom(B[5..8]);
rs6.fillRandom(C[3..4]);
writeln(A);
writeln(B);
writeln(C);

//
// Check getNth() method
//
for i in 1..8 {
  A[i] = rs4.getNth(i);
  B[i] = rs5.getNth(i);
}
for i in 1..4 {
  C[i] = rs6.getNth(i);
}
writeln(A);
writeln(B);
writeln(C);

//
// Check skipToNth()/getNext() methods
//
for i in 1..8 {
  rs4.skipToNth(i);
  A[i] = rs4.getNext();
  rs5.skipToNth(i);
  B[i] = rs5.getNext();
}
for i in 1..4 {
  rs6.skipToNth(i);
  C[i] = rs6.getNext();
}
writeln(A);
writeln(B);
writeln(C);

var rs7 = makeRandomStream(seed=314159265, eltType=real, algorithm=rtype);
var rs8 = makeRandomStream(seed=314159265, eltType=imag, algorithm=rtype);
var rs9 = makeRandomStream(seed=314159265, eltType=complex, algorithm=rtype);
//
// Check getNext() method
//
for i in 1..8 {
  A[i] = rs7.getNext();
  B[i] = rs8.getNext();
}
for i in 1..4 {
  C[i] = rs9.getNext();
}
writeln(A);
writeln(B);
writeln(C);

delete rs1;
delete rs2;
delete rs3;
delete rs4;
delete rs5;
delete rs6;
delete rs7;
delete rs8;
delete rs9;
