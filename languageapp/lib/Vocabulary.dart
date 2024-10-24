import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class VocabularyChallengePage extends StatefulWidget {
  @override
  _VocabularyChallengePageState createState() =>
      _VocabularyChallengePageState();
}

class _VocabularyChallengePageState extends State<VocabularyChallengePage> {
  int currentQuestion = 0;
  int correctAnswers = 0;
  bool showFeedback = false;
  bool isCorrect = false;
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What does "benevolent" mean?',
      'options': ['Kind', 'Angry', 'Funny', 'Sad'],
      'correct': 'Kind'
    },
    {
      'question': 'Which word is a synonym for "quick"?',
      'options': ['Slow', 'Fast', 'Heavy', 'Light'],
      'correct': 'Fast'
    },
    {
      'question': 'What is the meaning of "opaque"?',
      'options': ['Transparent', 'Cloudy', 'Solid', 'Hidden'],
      'correct': 'Cloudy'
    }
  ];

  void checkAnswer(String selected) {
    setState(() {
      showFeedback = true;
      if (selected == questions[currentQuestion]['correct']) {
        isCorrect = true;
        correctAnswers++;
      } else {
        isCorrect = false;
      }
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          if (currentQuestion < questions.length - 1) {
            currentQuestion++;
          } else {
            // Show rewards or level completion
            showCompletionDialog();
          }
          showFeedback = false;
        });
      });
    });
  }

  void showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Challenge Completed!',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'You answered $correctAnswers/${questions.length} correctly!',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestion = 0;
                correctAnswers = 0;
              });
            },
            child: const Text('Restart Challenge'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
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
        title: Text('Vocabulary Challenge',
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF26C6DA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Progress bar
              LinearProgressIndicator(
                value: (currentQuestion + 1) / questions.length,
                backgroundColor: Colors.white24,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
              const SizedBox(height: 30),

              // Question text
              FadeIn(
                child: Text(
                  question['question'],
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),

              // Answer options with enhanced design
              ...question['options'].map<Widget>((option) {
                return FadeInUp(
                  child: GestureDetector(
                    onTap: () {
                      if (!showFeedback) {
                        checkAnswer(option);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: const Color(0xFF0D47A1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 30),

              // Feedback
              if (showFeedback)
                ZoomIn(
                  child: Text(
                    isCorrect ? 'Correct! 🎉' : 'Incorrect! 😔',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? Colors.greenAccent : Colors.redAccent,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
