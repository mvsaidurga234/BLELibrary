import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  final List<String> guessed;
  final Function(String) onLetterTap;

  KeyboardWidget({required this.guessed, required this.onLetterTap});

  @override
  Widget build(BuildContext context) {
    final letters = 'abcdefghijklmnopqrstuvwxyz'.split('');
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: letters.map((letter) {
        bool disabled = guessed.contains(letter);
        return ElevatedButton(
          onPressed: disabled ? null : () => onLetterTap(letter),
          child: Text(letter.toUpperCase()),
        );
      }).toList(),
    );
  }
}
