import 'package:flutter/material.dart';

import 'hexcolors.dart';

class HomeIntro2App extends StatelessWidget {
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
              image: AssetImage("assets/intro-screen-2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You Too Can',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0
                ),),
              Text('Be Tracked On-The-Go',
                textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0
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
                  Navigator.pushNamed(context, '/register');
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}