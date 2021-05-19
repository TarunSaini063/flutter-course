import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/login-page.dart';

import 'pages/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.orange
      ),
      initialRoute: "/home",
      routes: {
        "/" : (context) => LoginPage(title: "Login Page",),
        "/login" : (context) => LoginPage(title: "Login Page",),
        "/home" : (context) => MyHomePage(title: "Home Page",),
      },
    );
  }
}
