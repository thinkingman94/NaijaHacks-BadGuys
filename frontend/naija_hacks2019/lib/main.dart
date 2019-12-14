// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'home.dart';
import 'addOptions.dart';
import 'register.dart';
import 'signup.dart';
import 'signupOtp.dart';
import 'signupCongrats.dart';
import 'homeIntro1.dart';
import 'homeIntro2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes',
// Start the app with the "/" named route. In this case, the app starts
// on the FirstScreen widget.
      initialRoute: '/',
      routes: {
// When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeApp(),
// When navigating to the "/second" route, build the SecondScreen widget.
        '/home-intro-1': (context) => HomeIntro1App(),
        '/home-intro-2': (context) => HomeIntro2App(),
        '/sign-up-app': (context) => SignUpApp(),
        '/register': (context) => RegisterApp(),
        '/signup-otp': (context) => SignupOtpApp(),
        '/signup-congrats': (context) => SignupCongratsApp(),
        '/add-options-app': (context) => AddOptionsApp(),
      },
    );
  }
}
