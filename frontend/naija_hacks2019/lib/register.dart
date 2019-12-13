import 'package:flutter/material.dart';

import 'hexcolors.dart';

class RegisterApp extends StatelessWidget {
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
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/logo-white.png"),
              Text('Ensure Safer Transits',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),),
              RaisedButton(
                color: Colors.white,
                textColor: HexColor.fromHex('#08004C'),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Text('Register',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic
                  ),),
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.pushNamed(context, '/sign-up-app');
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}