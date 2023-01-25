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

int checkPrime(num num) {
  int flag = 0;
  int i, m = 0;
  m = num ~/ 2;
  for (i = 2; i <= m; i++) {
    if (num % i == 0) {
      flag = 1;
      return flag;
      break;
    }
  }
  return flag;
}

num decoding(num n, num en) {
  num decode;
  num sqrt_n = sqrt(n).round();
  num i = sqrt_n as int;
  num p = 0;
  num q = 0;
  print(i);
  i = i + 1;
  while (i > 1) {
    if (n % i == 0) {
      q = i;
      p = n / i;
      p = p.toInt();
      break;
    }
    i++;
  }
  print(p);
  print(q);

  if (checkPrime(p) == 1 || checkPrime(q) == 1) {
    return 000;
  } else {
    print("this is the value of p");
    print(p);
    num phi = (p - 1) * (q - 1);
    print(phi);
    num e = 2;
    //for checking that 1 < e < phi(n) and gcd(e, phi(n)) = 1; i.e., e and phi(n) are coprime.
    while (e < phi) {
      if (gcd(e as int, phi as int) == 1) {
        break;
      } else {
        e++;
      }
    }

    num d1 = 1 / e;
    num d = d1 % phi;
    print(d);
    decode = pow(en, d);
    decode = decode % n;
    print(decode);
    decode = decode.round();
    print("this decoded");
    print(decode);
    return decode;
  }
}
