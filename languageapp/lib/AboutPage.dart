import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: Text('About Us',
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0D47A1), Color(0xFF26C6DA)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Purpose Section
              FadeInDown(
                child: const SectionCard(
                  title: "Our Purpose",
                  content:
                      "This app is designed to help you learn a new language through real-time conversations, vocabulary challenges, and daily practice. Whether you're a beginner or an advanced learner, we aim to make your language learning journey fun and engaging.",
                  icon: Icons.language,
                ),
              ),
              const SizedBox(height: 30),

              // Creators Section
              FadeInLeft(
                child: const SectionCard(
                  title: "About the Creators",
                  content:
                      "We are a team of passionate language enthusiasts and developers committed to providing the best learning experience possible. Our goal is to bridge the gap between languages and connect the world through learning.",
                  icon: Icons.people,
                ),
              ),
              const SizedBox(height: 30),

              // Getting Started Section
              FadeInRight(
                child: const SectionCard(
                  title: "How to Get Started",
                  content:
                      "To get started, simply choose the language you want to learn, set your daily goals, and start practicing with our AI-powered conversation bots. Don't forget to check your progress and unlock rewards as you learn!",
                  icon: Icons.flag,
                ),
              ),
              const SizedBox(height: 30),

              // Resources Section
              FadeInUp(
                child: const SectionCard(
                  title: "More Resources",
                  content:
                      "For additional learning materials, tips, and tricks, be sure to visit our website or reach out to us via email for personalized support. Happy learning!",
                  icon: Icons.help_outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const SectionCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
