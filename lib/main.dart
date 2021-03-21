import 'package:flutter/material.dart';
import 'package:flutter_app_velocity_x/LoginScreen.dart';
import 'package:flutter_app_velocity_x/OnBoardingScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(MyApp());
}

final TextTheme _textTheme = TextTheme(
  headline1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
  headline2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
  headline3: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
  headline4: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
  headline5: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
  headline6: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
  subtitle1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
  subtitle2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
  bodyText1: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
  bodyText2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
  button: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
  caption: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 13, color: Color(0xff4a4c4f))),
  overline: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 11, color: Color(0xff4a4c4f))),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Velocity X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: _textTheme,
        // inputDecorationTheme: _inputDecorationTheme,
      ),
      home: OnBoardingScreen(),
    );
  }
}
