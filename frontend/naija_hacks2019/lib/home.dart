import 'package:flutter/material.dart';

import 'hexcolors.dart';

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home-screen.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('"Safe Trip"',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),),
              Text('Just Got Safer',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0
                ),),
              RaisedButton(
                color: HexColor.fromHex('#08004C'),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Text('Next',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic
                  ),),
                onPressed: () {
                  Navigator.pushNamed(context, '/home-intro-1');
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}