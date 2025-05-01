import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final bool won = args['won'];
    final String word = args['word'];
    final String category = args['category'];

    return Scaffold(
      appBar: AppBar(title: Text(won ? '🎉 You Win!' : '💀 Game Over')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(won ? "Congratulations!" : "Try Again!",
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Text("The word was: $word", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("Play Again"),
              onPressed: () => Navigator.pushReplacementNamed(
                context, '/game',
                arguments: category,
              ),
            ),
            TextButton(
              child: Text("Back to Home"),
              onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
            ),
          ],
        ),
      ),
    );
  }
}
