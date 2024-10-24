import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class AchievementsPage extends StatelessWidget {
  final List<Map<String, dynamic>> achievements = [
    {
      'title': '10 Lessons Completed',
      'icon': Icons.book,
      'unlocked': true,
      'description': 'You’ve completed 10 lessons! Keep going!'
    },
    {
      'title': '50 Conversation Hours',
      'icon': Icons.chat,
      'unlocked': true,
      'description': 'You’ve practiced for 50 hours! Awesome!'
    },
    {
      'title': '100 New Words Learned',
      'icon': Icons.language,
      'unlocked': true,
      'description': 'You’ve learned 100 new words! Impressive!'
    },
    {
      'title': 'Daily Streak: 7 Days',
      'icon': Icons.local_fire_department,
      'unlocked': false,
      'description': 'Log in daily for 7 days to unlock this badge!'
    },
    {
      'title': 'Level Up!',
      'icon': Icons.military_tech,
      'unlocked': false,
      'description': 'Reach the next level to unlock this badge!'
    }
  ];

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
        title: Text('Achievements & Rewards',
            style: GoogleFonts.poppins(
                fontSize: 16,
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return FadeInUp(
                delay: Duration(milliseconds: 200 * index),
                child: AchievementCard(
                  title: achievement['title'],
                  icon: achievement['icon'],
                  unlocked: achievement['unlocked'],
                  description: achievement['description'],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AchievementCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool unlocked;
  final String description;

  const AchievementCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.unlocked,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: unlocked ? Colors.white.withOpacity(0.15) : Colors.white12,
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
        children: [
          Icon(icon,
              color: unlocked ? Colors.greenAccent : Colors.white24, size: 50),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          if (unlocked)
            const Icon(Icons.check_circle, color: Colors.greenAccent, size: 30),
        ],
      ),
    );
  }
}
