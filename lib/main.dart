import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/login-page.dart';
import 'package:flutter_starter/utils/MyRoutes.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.orange
      ),
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        "/" : (context) => LoginPage(title: "Login Page",),
        MyRoutes.loginRoutes : (context) => LoginPage(title: "Login Page",),
        MyRoutes.homeRoutes : (context) => MyHomePage(title: "Home Page",),
      },
    );
  }
}
