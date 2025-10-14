import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int tapCount = 0;
  String currentEmoji = '😊';
  String motivationalQuote = '"Tap your way to happiness!"';
  late AnimationController _scaleController;
  late AnimationController _rotateController;
  late Animation<double> _scaleAnimation;

  final List<Map<String, String>> emojiQuotes = [
    {'emoji': '😊', 'quote': '"Happiness is a choice, choose to smile!"'},
    {'emoji': '🎉', 'quote': '"Celebrate every small victory!"'},
    {'emoji': '🚀', 'quote': '"Reach for the stars and beyond!"'},
    {'emoji': '💪', 'quote': '"You are stronger than you think!"'},
    {'emoji': '🌟', 'quote': '"Shine bright like a star!"'},
    {'emoji': '❤️', 'quote': '"Spread love wherever you go!"'},
    {'emoji': '🎯', 'quote': '"Focus on your goals and achieve!"'},
    {'emoji': '🔥', 'quote': '"You are on fire today!"'},
    {'emoji': '🌈', 'quote': '"After every storm comes a rainbow!"'},
    {'emoji': '🎨', 'quote': '"Create your own masterpiece!"'},
  ];

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _rotateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  void _onEmojiTap() {
    setState(() {
      tapCount++;
      final random = Random();
      final selectedQuote = emojiQuotes[random.nextInt(emojiQuotes.length)];
      currentEmoji = selectedQuote['emoji']!;
      motivationalQuote = selectedQuote['quote']!;
    });

    _scaleController.forward().then((_) => _scaleController.reverse());
    _rotateController.forward().then((_) => _rotateController.reset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Emojiess',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Top Stats Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'TAPS',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  tapCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Motivational Quote
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
                child: AnimatedTextKit(
                  key: ValueKey(motivationalQuote),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      motivationalQuote,
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  repeatForever: false,
                ),
              ),
            ),
          ),

          const Spacer(),

          // Emoji Tap Button
          GestureDetector(
            onTap: _onEmojiTap,
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return RotationTransition(
                  turns: Tween<double>(
                    begin: 0,
                    end: 0.1,
                  ).animate(_rotateController),
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          currentEmoji,
                          style: const TextStyle(fontSize: 80),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'TAP THE EMOJI',
            style: TextStyle(
              fontSize: 16,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Spacer(),

          // Lottie Animation at Bottom
          Lottie.asset(
            'assets/blue.json',
            width: 150,
            height: 100,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
