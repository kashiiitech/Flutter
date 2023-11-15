import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({required this.startQuiz,super.key});
  final void Function() startQuiz;
 @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 300, color: const Color.fromARGB(150, 250, 250, 250),),
        const SizedBox(height: 80,),
        const Text("Flutter Quiz App!!", style: TextStyle(color: Colors.black87, fontSize: 24),),
        const SizedBox(height: 30,),
        OutlinedButton.icon(onPressed: () {
          startQuiz();
        }, style: OutlinedButton.styleFrom(foregroundColor: Colors.white), icon: const Icon(Icons.arrow_right_alt) , label: const Text("Start Quiz"))
      ],
    ));
  }
}