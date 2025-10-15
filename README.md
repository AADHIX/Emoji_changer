# Emoji Tapper Game

A fun and fast-paced mobile game built with Flutter where players test their reflexes by tapping a sequence of emojis. This project features a clean architecture, a smooth user interface, and engaging gameplay.

<!-- Optional: Add a nice header image or GIF of the app in action -->
<!-- ![Emoji Tapper Showcase](link_to_your_header_image.png) -->

## 🚀 Features

-   **Engaging Splash Screen**: A welcoming animated entry point to the application.
-   **Dynamic Gameplay**: Tap the correct emojis as they appear to score points.
-   **Timer & Score Tracking**: A countdown timer adds a layer of challenge, and a real-time score keeps you motivated.
-   **Immediate Feedback**: The UI provides instant visual cues for correct and incorrect taps.
-   **Results Screen**: After the game ends, view your final score, accuracy, and other stats.
-   **Clean UI/UX**: A minimalist and intuitive design built with modern aesthetics.

## 📸 Screenshots



| Splash Screen                                       | Game Screen                                     | Results Screen                                      |
| --------------------------------------------------- | ----------------------------------------------- | --------------------------------------------------- |
| `assets/readme/splash_screen.png` (placeholder)     | `assets/readme/game_screen.png` (placeholder)   | `assets/readme/results_screen.png` (placeholder)    |

## 🛠️ Tech Stack & Dependencies

-   **Framework**: [Flutter](https://flutter.dev/)
-   **Language**: [Dart](https://dart.dev/)
-   **Primary Font**: [Poppins](https://fonts.google.com/specimen/Poppins)

## 📋 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

Ensure you have the Flutter SDK installed on your system. For installation instructions, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation & Setup

1.  **Clone the repository:**
2.   **git clone repo ""   
4.  **Run the application:**    Connect a device or start an emulator, then run the following command:
 

## 📂 Project Structure

The project follows a standard Flutter application structure to ensure maintainability and scalability.

Flutter Emoji Tapper App - Complete Project Documentation
📋 Table of Contents
Project Overview

Features

File Structure

Installation & Setup

Code Implementation

Git Workflow

Dependencies

Development Guide

Troubleshooting

## 🎯 Project Overview
Emojiess is a fun and engaging Flutter application designed to spread positivity through interactive emoji tapping. Users can tap on animated emojis to discover motivational quotes while enjoying smooth animations and a beautiful user interface.

## ✨ Features
🎨 Beautiful UI: Clean black and white theme with modern design

✨ Smooth Animations: Scale and rotation effects on emoji tap

💫 Interactive Experience: Tap-based gameplay with visual feedback

📝 Motivational Quotes: 10 different emoji-quote combinations

📊 Progress Tracking: Real-time tap counter

🎭 Dynamic Content: Random emoji and quote selection

🔄 Splash Screen: Elegant app introduction

🎬 Lottie Animations: Enhanced visual experience

## 📁 File Structure
*** text
emoji_tapper/
├── lib/
│   ├── main.dart
│   ├── splash_screen.dart
│   └── home_screen.dart
├── assets/
│   ├── animations/
│   │   └── blue.json
│   └── images/
├── fonts/
│   ├── Poppins-Regular.ttf
│   └── Poppins-Bold.ttf
├── pubspec.yaml
├── README.md
└── .gitignore
### 🚀 Installation & Setup
Prerequisites
Flutter SDK (version 3.0.0 or higher)

Dart (version 2.18.0 or higher)

Git for version control

### Step-by-Step Installation
## Clone the Repository

bash
git clone https://github.com/yourusername/emoji_tapper.git
cd emoji_tapper
Install Dependencies

bash
flutter pub get
Add Asset Files

Place Lottie animation files in assets/animations/

Add font files in fonts/ directory

Add any images in assets/images/

Run the Application

bash
flutter run
### 💻 Code Implementation
## 1. lib/main.dart
dart
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
2. lib/splash_screen.dart
dart
import 'package:flutter/material.dart';
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
    // Navigate to home screen after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '😊',
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: 20),
            Text(
              'Emojiess',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
## 3. lib/home_screen.dart
dart
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
            'assets/animations/blue.json',
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
## 4. pubspec.yaml
yaml
name: emoji_tapper
description: A fun emoji tapping game built with Flutter

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=2.18.0 <3.0.0'

dependencies:
  flutter:
    sdk: flutter
  animated_text_kit: ^4.2.2
  lottie: ^2.3.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  
  fonts:
    - family: Poppins
      fonts:
        - asset: fonts/Poppins-Regular.ttf
        - asset: fonts/Poppins-Bold.ttf
          weight: 700

  assets:
    - assets/images/
    - assets/animations/
🔧 Git Workflow
Initial Repository Setup
bash
# Initialize git repository
git init

# Add all files to staging
git add .

# Make initial commit
git commit -m "feat: initial commit - Flutter Emoji Tapper app with splash screen and interactive home screen"

# Add remote repository
git remote add origin https://github.com/yourusername/emoji_tapper.git

# Push to main branch
git branch -M main
git push -u origin main
Feature Development Workflow
bash
# Create a new feature branch
git checkout -b feature/home-screen-animations

# Make changes and commit
git add .
git commit -m "feat: add scale and rotation animations to emoji tap"

# Push feature branch
git push origin feature/home-screen-animations

# Create Pull Request on GitHub, then merge
git checkout main
git merge feature/home-screen-animations
git push origin main
Commit Convention
markdown
feat: new feature
fix: bug fix
docs: documentation changes
style: formatting, missing semi-colons, etc.
refactor: code refactoring
test: adding tests
chore: maintenance
📦 Dependencies
Main Dependencies
flutter: Core Flutter framework

animated_text_kit: ^4.2.2 - For typewriter text animations

lottie: ^2.3.2 - For Lottie animation support

Dev Dependencies
flutter_test: Flutter testing utilities

flutter_lints: ^2.0.0 - Dart and Flutter lints

## 🎮 How to Play
Launch the App: Open the application to see the splash screen

Wait for Transition: The app automatically transitions to the home screen

Tap the Emoji: Press the central emoji to interact

Watch Animations: Enjoy scale and rotation effects

Discover Quotes: Each tap reveals a new motivational quote

Track Progress: Monitor your tap count in the header

Explore Combinations: Discover all 10 emoji-quote pairs

🔄 App Flow
Splash Screen (2 seconds)

Displays app logo and name

Automatic navigation to home screen

Home Screen

Tap counter display

Motivational quote section

Interactive emoji button

Bottom Lottie animation

## 🎨 Customization Guide
Adding New Emoji-Quote Combinations
dart
// Add to emojiQuotes list in home_screen.dart
{'emoji': '🎸', 'quote': '"Rock on with your positive vibes!"'},
{'emoji': '🚲', 'quote': '"Keep moving forward no matter what!"'},
Modifying Animation Durations
dart
// Change animation speeds
_scaleController = AnimationController(
  duration: const Duration(milliseconds: 300), // Adjust as needed
  vsync: this,
);
Customizing Colors
dart
// Change theme colors in main.dart
theme: ThemeData(
  primarySwatch: Colors.blue, // Change primary color
  scaffoldBackgroundColor: Colors.grey[50], // Change background
),
## 🐛 Troubleshooting
Common Issues
Lottie Animation Not Showing

Ensure blue.json is in assets/animations/

Verify pubspec.yaml includes the assets path

Run flutter pub get after adding assets

Fonts Not Loading

Check font files are in fonts/ directory

Verify font family name in pubspec.yaml matches code

Restart app after adding fonts

Animations Not Working

Check animation controllers are properly disposed

Verify TickerProviderStateMixin is used

Ensure animation controllers are initialized in initState

Build Errors

Run flutter clean

Execute flutter pub get

Try flutter run --verbose for detailed logs

Debug Commands
bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run in debug mode
flutter run --debug

# Run with detailed logs
flutter run --verbose

# Analyze code
flutter analyze
## 📱 Platform Support
Android: ✅ Fully supported

iOS: ✅ Fully supported

Web: ⚠️ Limited testing

Desktop: ⚠️ Limited testing

🤝 Contributing
We welcome contributions! Please follow these steps:

Fork the project

Create a feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments
Flutter team for the amazing framework

Lottie for beautiful animations

Animated Text Kit for text animations

The Flutter community for continuous support

Happy Tapping! 🎉 If you enjoy this project, please give it a ⭐ on GitHub!



   
    
