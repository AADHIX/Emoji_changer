// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Emoji Icon
            const Text('😊', style: TextStyle(fontSize: 100)),
            const SizedBox(height: 40),
            // Animated Text
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Emojies',
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
                repeatForever: false,
              ),
            ),
            const SizedBox(height: 20),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 1,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Tap to feel the magic ✨',
                    duration: const Duration(seconds: 2),
                  ),
                ],
                repeatForever: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
