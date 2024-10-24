import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animate_do/animate_do.dart';

class DailyGoalsPage extends StatelessWidget {
  final double dailyGoalProgress = 0.75;
  final double overallProgress = 0.60;

  final List<String> motivationalMessages = [
    "Keep pushing forward! 🌟",
    "You’re doing great! Every word counts. 📚",
    "Consistency is the key! 🔑",
    "Language learning is a marathon, not a sprint. 🏃",
    "Keep up the momentum, you’re almost there! 💪"
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
        title: Text(
          'Daily Goals & Progress',
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF42A5F5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Daily Progress Section
                FadeInDown(
                  child: Text(
                    'Daily Goal Progress',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Animated Progress Bar for Daily Goals
                FadeInLeft(
                  child: LinearPercentIndicator(
                    lineHeight: 20.0,
                    percent: dailyGoalProgress,
                    center: Text(
                      '${(dailyGoalProgress * 100).toStringAsFixed(0)}%',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    backgroundColor: Colors.white24,
                    progressColor: Colors.greenAccent,
                    animation: true,
                    animationDuration: 1200,
                    barRadius: const Radius.circular(16),
                  ),
                ),

                const SizedBox(height: 30),

                // Overall Progress Section
                FadeInDown(
                  child: Text(
                    'Overall Progress',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                FadeInRight(
                  child: Center(
                    child: CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 13.0,
                      percent: overallProgress,
                      center: Text(
                        '${(overallProgress * 100).toStringAsFixed(0)}%',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      progressColor: Colors.orangeAccent,
                      backgroundColor: Colors.white24,
                      animation: true,
                      animationDuration: 1200,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Daily Motivational Message
                FadeInUp(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        motivationalMessages[DateTime.now().weekday %
                            motivationalMessages.length],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Rewards Section
                FadeInUp(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RewardBadge(
                        title: "Daily Streak",
                        icon: Icons.local_fire_department,
                        unlocked: dailyGoalProgress >= 1,
                      ),
                      RewardBadge(
                        title: "100 Words",
                        icon: Icons.star,
                        unlocked: overallProgress >= 0.5,
                      ),
                      RewardBadge(
                        title: "Level Up!",
                        icon: Icons.military_tech,
                        unlocked: overallProgress >= 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RewardBadge extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool unlocked;

  const RewardBadge({
    Key? key,
    required this.title,
    required this.icon,
    required this.unlocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Badge Icon
        BounceInDown(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: unlocked ? Colors.yellowAccent : Colors.white12,
              shape: BoxShape.circle,
              boxShadow: unlocked
                  ? [
                      BoxShadow(
                        color: Colors.yellowAccent.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              color: unlocked ? Colors.yellowAccent : Colors.white24,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Badge Title
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: unlocked ? Colors.white : Colors.white24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
