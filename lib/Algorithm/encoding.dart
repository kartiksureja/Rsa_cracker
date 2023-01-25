import 'dart:math';

int gcd(int a, int b) {
  int t;
  while (true) {
    t = a % b;
    if (t == 0) return b;
    a = b;
    b = t;
  }
}

num encoding(num mess, num p, num q) {
  num encode;
  num n = p * q; //calculate n
  num phi = (p - 1) * (q - 1);
  num e = 7;
  //for checking that 1 < e < phi(n) and gcd(e, phi(n)) = 1; i.e., e and phi(n) are coprime.
  while (e < phi) {
    if (gcd(e as int, phi as int) == 1) {
      break;
    } else {
      e++;
    }
  }
  encode = pow(mess, e);
  print(e);
  return encode;
}
