import 'package:flutter/material.dart';

import 'hexcolors.dart';

class SignupCongratsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
        body: Container(
          color: HexColor.fromHex('#ffffff'),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/logo-blue.png"),
              Text('Congratulations!',
                textAlign: TextAlign.center,style: TextStyle(
                    color: HexColor.fromHex('#08004C'),
                    fontSize: 22.0
                ),),
              Text('You\'r All Set!',
                textAlign: TextAlign.center,style: TextStyle(
                    color: HexColor.fromHex('#08004C'),
                    fontSize: 22.0
                ),),
              RaisedButton(
                color: Colors.white,
                textColor: HexColor.fromHex('#a5000d'),
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
                  Navigator.pop(context);
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
