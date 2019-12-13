import 'package:flutter/material.dart';

import 'hexcolors.dart';

class SignupOtpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
        body: Container(
          color: HexColor.fromHex('#08004C'),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/logo-white.png"),
              Text('Input Your OTP',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),),
              TextField(
                autofocus: false,
                style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  hintText: 'OTP',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.white,
                textColor: HexColor.fromHex('#08004C'),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic),
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, '/signup-congrats');
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
