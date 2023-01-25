import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rsa_cracker/Widgets/input_text_field.dart';
import 'package:rsa_cracker/Widgets/simple_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dataController = TextEditingController();
  final nDataController = TextEditingController();
  var encode;
  var decode;
  var en;
  @override
  Widget build(BuildContext context) {
    num p = 19;
    num q = 17;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("RSA Cracker")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SimpleContainer(
                  Ccolor: Colors.blueAccent,
                  followChild: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: InputFieldBox(
                      userIdController: dataController,
                      inLable: "Enter the Plaintext",
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SimpleContainer(
                Ccolor: Colors.green,
                followChild: GestureDetector(
                  onTap: () {
                    int gcd(int a, int b) {
                      int t;
                      while (true) {
                        t = a % b;
                        if (t == 0) return b;
                        a = b;
                        b = t;
                      }
                    }

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

                    num message = num.parse(dataController.text);
                    setState(() {
                      en = pow(message, e);
                      print(e);
                      encode = en % n;
                      print(encode);
                    });
                  },
                  child: Center(
                      child: Text(
                    "ENCODE",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.normal),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
                child: Center(
                  child: Center(
                    child: Icon(
                      Icons.arrow_downward,
                      size: 20,
                    ),
                  ),
                ),
              ),
              SimpleContainer(
                  followChild: Center(
                      child: Text(
                    "$encode",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                  Ccolor: Colors.blueAccent),
              SizedBox(
                height: 20,
              ),
              SimpleContainer(
                  Ccolor: Colors.blueAccent,
                  followChild: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: InputFieldBox(
                      userIdController: nDataController,
                      inLable: "Enter the value of n",
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SimpleContainer(
                  followChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        int gcd(int a, int b) {
                          int t;
                          while (true) {
                            t = a % b;
                            if (t == 0) return b;
                            a = b;
                            b = t;
                          }
                        }

                        num n = num.parse(nDataController.text);
                        print(n);
                        num sqrt_n = sqrt(n).round();
                        num i = sqrt_n as int;
                        print(i);
                        i = i + 1;
                        while (i > 1) {
                          if (n % i == 0) {
                            p = i;
                            q = n / i;
                            q = q.toInt();
                            break;
                          }
                          i++;
                        }
                        print(p);
                        print(q);
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
                        num d1 = 1 / e;
                        num d = d1 % phi;
                        print(d);
                        decode = pow(en, d);
                        decode = decode % n;
                        decode = decode.round();
                        print("this decoded");
                        print(encode);
                        print(decode);
                      });
                    },
                    child: Center(
                        child: Text(
                      "DECODE",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.normal),
                    )),
                  ),
                  Ccolor: Colors.red),
              SizedBox(
                height: 20,
                child: Center(
                  child: Icon(
                    Icons.arrow_downward,
                    size: 20,
                  ),
                ),
              ),
              SimpleContainer(
                  followChild: Center(
                      child: Text(
                    "$decode",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
                  Ccolor: Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}
