// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';
import 'sign-up.dart';
import 'signup-otp.dart';
import 'signup-congrats.dart';
import 'home-intro-1.dart';
import 'home-intro-2.dart';

void main() => runApp(MaterialApp(
  title: 'Named Routes Demo',
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
  },
));

