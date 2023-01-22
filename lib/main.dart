import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      inLable: "Plaintext",
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SimpleContainer(
                Ccolor: Colors.green,
                followChild: GestureDetector(
                  onTap: () {},
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
              ),
              SimpleContainer(
                  followChild: Center(
                      child: Text(
                        "Encoded plaintext",
                        style: TextStyle(fontSize: 30),
                      )),
                  Ccolor: Colors.blueAccent),
              SizedBox(
                height: 20,
              ),
              SimpleContainer(
                  followChild: GestureDetector(
                    onTap: () {},
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
              ),
              SimpleContainer(
                  followChild: Center(
                      child: Text(
                        "Decoded cyphertext",
                        style: TextStyle(fontSize: 30),
                      )),
                  Ccolor: Colors.blueAccent)
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleContainer extends StatelessWidget {
  const SimpleContainer(
      {super.key, required this.followChild, required this.Ccolor});
  final Widget followChild;
  final Color Ccolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Ccolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: followChild,
      ),
    );
  }
}

class InputFieldBox extends StatelessWidget {
  InputFieldBox({Key? key, required this.inLable}) : super(key: key);

  // final TextEditingController userIdController;
  final String inLable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,
      // controller: userIdController,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: inLable,
        labelStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
        focusedBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 2.5, color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        disabledBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        suffixStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
