import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtt_news_today/views/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
    ),
      ),
      home: SignUp(),
    );
  }
}
