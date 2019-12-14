import 'package:flutter/material.dart';

import 'hexColors.dart';

class AddOptionsApp extends StatelessWidget {
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
              Text(
                'One More Thing...',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              Text(
                'Seems quite silent here',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Text(
                'Lets get some',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              Text(
                'People involved!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: HexColor.fromHex('#08004C'),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child: Text(
                      'Add Via Contacts',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: HexColor.fromHex('#08004C'),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child: Text(
                      'Add Via Facebook',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
              new Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: HexColor.fromHex('#08004C'),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child: Text(
                      'Add Via Google',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
