import 'package:flutter/material.dart';

import 'package:scan_preview/scan_preview_widget.dart';

class ScanScreen extends StatefulWidget {
  final pin;
  ScanScreen(this.pin);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool verified = false;
  String status = "Scanning...";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Verification'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: ScanPreviewWidget(
                    onScanResult: (result) {
                      if (this.widget.pin == "2468" &&
                          result ==
                              "ADEOEU5512RFMFKFIRJ8811AW22EDDFDGDFGPROIFGFF") {
                        setState(() {
                          verified = true;
                          status = "Verified Successfully !!!";
                        });
                      } else {
                        setState(() {
                          status = "Verification Failed !!! ";
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 50),
                verified
                    ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(200),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/verified.png",
                                ),
                                fit: BoxFit.cover)))
                    : Container(),
                SizedBox(height: 10),
                verified
                    ? Text(
                        status,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      )
                    : Text(
                        status,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
