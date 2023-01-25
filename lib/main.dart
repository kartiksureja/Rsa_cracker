import 'package:flutter/material.dart';
import 'package:rsa_cracker/Algorithm/decoding.dart';
import 'package:rsa_cracker/Algorithm/encoding.dart';
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
    num p = 11;
    num q = 13;

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
                    num n = p * q;
                    num message = num.parse(dataController.text);
                    setState(() {
                      en = encoding(message, p, q);
                      encode = en % n;
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
                        decode = null;
                      });
                      setState(() {
                        num n = num.parse(nDataController.text);
                        decode = decoding(n, en);
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
