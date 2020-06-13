import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import './scan.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _textEditingController = new TextEditingController();

  void checkInput(context) {
    if (_textEditingController.text.length >= 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ScanScreen(_textEditingController.text)));
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  _requestPermission() async {
    await Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                body: Container(
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: TextField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Type your ID",
                      enabledBorder: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: InputBorder.none),
                  onSubmitted: (value) {
                    checkInput(context);
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {
                  checkInput(context);
                },
                child: Text(
                  "Next",
                ),
              )
            ],
          ),
        ))));
  }
}
