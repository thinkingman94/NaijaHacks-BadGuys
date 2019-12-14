import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

import 'hexColors.dart';

import 'SignupArguments.dart';

class Dialog {
  Dialog(context, message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has entered by using the
          // TextEditingController.
          content: Text(message), //e.toString()
        );
      },
    );
  }
}

class SignupOtpApp extends StatelessWidget {
  static const routeName = '/signup-otp';
  final Map<String, TextEditingController> formsControllers = {
    "otp": TextEditingController()
  };
  SignupArguments signupArgs;

  void onOtpSignUp(context) async {
    try {
      final name = this.signupArgs.name.split(' ');
      var r = await Requests.post("http://139.162.220.117:3000/api/auth/signup",
          body: {
            "id": this.signupArgs.id,
            "first_name": name[0],
            "last_name": name.length > 1 ? name[1] : '',
            "otp": this.formsControllers['otp'].text
          },
          bodyEncoding: RequestBodyEncoding.JSON);

      dynamic json = r.json();

      switch (r.statusCode) {
        case 200:
        case 201:
          Navigator.pushNamed(context, '/signup-congrats');
          break;
        case 400:
        case 500:
        default:
          Dialog(
              context,
              json.containsKey("error") && json['error'] is String
                  ? json['error']
                  : 'There was a problem processing your request, please try again');
          break;
      }
    } catch (e) {
      print(e.toString());
      Dialog(context, 'Network error, Please try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    this.signupArgs = ModalRoute.of(context).settings.arguments;
    print(signupArgs.id);
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
              Text(
                'Input Your OTP',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              TextField(
                controller: this.formsControllers['otp'],
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
                  //print(args.id)
                  //Navigator.pop(context);
                  onOtpSignUp(context);
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
