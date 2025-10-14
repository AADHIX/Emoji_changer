import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const EmojiTapperApp());
}

class EmojiTapperApp extends StatelessWidget {
  const EmojiTapperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Tapper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
