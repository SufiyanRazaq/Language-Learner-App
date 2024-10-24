import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:languageapp/login.dart'; // Adjust the path as needed

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;

  @override
  void initState() {
    super.initState();

    // Logo Animation Setup
    _logoController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _logoAnimation =
        CurvedAnimation(parent: _logoController, curve: Curves.easeInOut);

    _logoController.forward();

    // Navigate to login page after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF26C6DA)], // Elegant gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              ScaleTransition(
                scale: _logoAnimation,
                child: BounceInDown(
                  child: Image.asset(
                    'assets/logo.png', // Ensure logo asset is in place
                    height: 150, // Adjust the size as needed
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // App Name with Animation
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                child: Text(
                  'Language Learner Pro', // Replace with your app's name
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // App Tagline
              FadeInUp(
                delay: const Duration(milliseconds: 1000),
                child: Text(
                  'Master Languages\nThrough Real Conversations',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // Loading Indicator with Animation
              const SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0, // Smooth loading animation
              ),
            ],
          ),
        ),
      ),
    );
  }
}
