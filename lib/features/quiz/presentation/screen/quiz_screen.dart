import 'package:flutter/material.dart';
import 'package:play_kido/core/common_widget/animated_gaming_button.dart';
import 'package:play_kido/core/common_widget/common_app_dialog.dart';
import 'package:play_kido/core/common_widget/common_pressable_scale.dart';
import 'package:play_kido/core/size_config/size_config.dart';
import 'package:play_kido/features/quiz/data/model/phonics_quiz.dart';
import 'package:play_kido/features/quiz/presentation/widget/audio_play_time.dart';
import 'package:play_kido/features/quiz/presentation/widget/options_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  late QuizQuestionModel currentQuestion;
  late List<String> userAnswer;
  int currentIndex = 0;
  dynamic player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayerExample();
    loadQuestion();
  }

  void loadQuestion() {
    currentQuestion = quizQuestios[currentQuestionIndex];
    userAnswer = List.filled(currentQuestion.word.length, '');
    currentIndex = 0;
  }

  void nextQuestion() {
    if (currentQuestionIndex < quizQuestios.length - 1) {
      setState(() {
        currentQuestionIndex++;
        loadQuestion();
      });
    } else {
      showCompletionDialog(
        context,
        lessonNumber: '${currentQuestionIndex + 1}',
        userName: 'John Doe',
        reward: 10,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF3349),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFD92036),
                            offset: Offset(0, 1),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                  Text(
                    'Lesson ${currentQuestionIndex + 1}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ComicSans',
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 40),

              // Question
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Spell the word:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'ComicSans',
                    ),
                  ),
                  PressableScale(
                    onTap: () {
                      player.playAudioSegment(
                        currentQuestion.sound,
                        Duration(seconds: currentQuestion.startTime),
                        Duration(seconds: currentQuestion.endTime),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFffcf26),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFedb900),
                            offset: Offset(0, 2),
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Fox Image
              Container(
                // width: 150,
                // height: 150,
                decoration: const BoxDecoration(
                  // color: Color(0xFFF9E6D6),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF9E6D6),
                      offset: Offset(6, 6),
                      spreadRadius: 12,
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    // 'assets/character/duck.png',
                    currentQuestion.image,
                    width: SizeConfig.getWidth(50),
                    height: SizeConfig.getWidth(50),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  currentQuestion.word.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: 40,
                    child: Column(
                      children: [
                        Text(
                          userAnswer[index],
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF4A7B5F),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ComicSans',
                          ),
                        ),
                        Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4A7B5F).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Letter Options
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(
                  currentQuestion.options.length,
                  (index) => OptionWidget(
                    options: currentQuestion.options,
                    index: index,
                    ontap: () {
                      if (currentIndex < currentQuestion.word.length) {
                        setState(() {
                          userAnswer[currentIndex] = currentQuestion.options[index];
                          currentIndex++;
                        });
                      }
                    },
                  ),
                ),
              ),
              const Spacer(),

              // Finish Button

              AnimatedGamingButton(
                buttomText: currentQuestionIndex == quizQuestions.length - 1 ? 'Finish' : 'Next',
                width: double.infinity,
                onTap: nextQuestion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
