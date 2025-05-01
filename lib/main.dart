import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/game_screen.dart';
import 'screens/result_screen.dart';
import 'screens/add_category_screen.dart';
import 'data/word_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WordRepository.loadWords();
  runApp(HangmanApp());
}

class HangmanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/game': (context) => GameScreen(),
        '/result': (context) => ResultScreen(),
        '/add': (context) => AddCategoryScreen(),
      },
    );
  }
}
