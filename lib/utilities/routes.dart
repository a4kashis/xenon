import 'package:xenon/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:xenon/screens/home.dart';
import 'package:xenon/screens/signup.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => Login(),
  '/signUP': (BuildContext context) => SignUp(),
  '/home': (BuildContext context) => MenuDashboardPage(),
};
