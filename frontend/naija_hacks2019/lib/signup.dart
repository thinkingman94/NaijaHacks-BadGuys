import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

import 'hexColors.dart';
import 'signupOtp.dart';
import 'SignupArguments.dart';

class SignUpApp extends StatelessWidget {
  final Map<String, TextEditingController> formsControllers = {
    "name": TextEditingController(),
    "phone": TextEditingController()
  };

  void onSignUp(context) async {
try {
      var r =
          await Requests.post("http://139.162.220.117:3000/api/auth/otp_init",
              body: {
                "subject": this.formsControllers['phone'].text
              },
              bodyEncoding: RequestBodyEncoding.JSON);

      r.raiseForStatus();
      dynamic json = r.json();

      Navigator.pushNamed(
        context,
        SignupOtpApp.routeName,
        arguments: SignupArguments(json['id'], this.formsControllers['name'].text),
      );
    } catch (e) {print(e.toString());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has entered by using the
            // TextEditingController.
            content: Text('Network error, Please try again'),//e.toString()
          );
        },
      );
    }
  }

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
              TextField(
                controller: this.formsControllers['name'],
                autofocus: false,
                style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                controller: this.formsControllers['phone'],
                autofocus: false,
                style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70, width: 1.0),
                  ),
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              CheckboxListTile(
                title: Text(
                  "By Signing up, you agree to our Terms and Conditions",
                  style: TextStyle(color: Colors.white),
                ),
                value: false,
                activeColor: Colors.white,
                checkColor: HexColor.fromHex('#08004C'),
                //onChanged: (newValue) { ... },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
              RaisedButton(
                color: Colors.white,
                textColor: HexColor.fromHex('#08004C'),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      textBaseline: TextBaseline.alphabetic),
                ),
                onPressed: () {
                  onSignUp(context);
                },
              )
            ],
          )),
        ),
      ),
        routes: {
          SignupOtpApp.routeName: (context) => SignupOtpApp(),
        }
    );
  }
}
