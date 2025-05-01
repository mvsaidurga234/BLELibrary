import 'dart:math';
import 'package:flutter/material.dart';
import '../data/word_data.dart';
import '../widgets/keyboard_widget.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String category;
  late String word;
  List<String> guessed = [];
  int incorrect = 0;
  final int maxIncorrect = 6;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as String;
    word = (WordRepository.getWords(category)..shuffle()).first;
  }

  void guessLetter(String letter) {
    if (!guessed.contains(letter)) {
      setState(() {
        guessed.add(letter);
        if (!word.contains(letter)) incorrect++;
      });
    }

    bool won = word.split('').every((l) => guessed.contains(l));
    bool lost = incorrect >= maxIncorrect;

    if (won || lost) {
      Future.delayed(Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(context, '/result', arguments: {
          'won': won,
          'word': word,
          'category': category,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayWord = word
        .split('')
        .map((l) => guessed.contains(l) ? l : '_')
        .join(' ');

    return Scaffold(
      appBar: AppBar(title: Text('Category: $category')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Incorrect: $incorrect / $maxIncorrect',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
                Container(
              height: 200,
              child: Image.asset(
                'assets/hangman/hangman_$incorrect.png',
                fit: BoxFit.contain,
              ),
            ),
            Text(displayWord, style: TextStyle(fontSize: 32, letterSpacing: 2)),
            SizedBox(height: 20),
            KeyboardWidget(onLetterTap: guessLetter, guessed: guessed),
          ],
        ),
      ),
    );
  }
}
