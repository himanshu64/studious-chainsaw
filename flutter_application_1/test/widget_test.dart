// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/viewmodels/game_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  group('gameModel Tests', () {
    test('Initial gameModel state', () {
      final gameModel = GameModel();

      expect(gameModel.timerSeconds, 5);
      expect(gameModel.score, 0);
      expect(gameModel.attempts, 0);
      expect(gameModel.randomNumber, 0);
      expect(gameModel.isSuccess, false);
      expect(gameModel.isFailure, false);
      expect(gameModel.failureMessage, '');
    });

    test('Tap on Widget 5 increments attempts', () {
      final gameModel = GameModel();
      final initialAttempts = gameModel.attempts;

      gameModel.onTap();

      expect(gameModel.attempts, initialAttempts + 1);
    });

    test('Correct guess increments score', () async {
      final gameModel = GameModel();
      final initialScore = gameModel.score;

      // gameModel.generateRandomNumber();
      await gameModel.onTap(); // Simulate a correct guess

      expect(gameModel.score, initialScore + 1);
      expect(gameModel.isSuccess, true);
    });

    test('Incorrect guess triggers failure', () async {
      final gameModel = GameModel();
      final initialAttempts = gameModel.attempts;

      gameModel.generateRandomNumber();
      await gameModel.onTap(); // Simulate an incorrect guess

      expect(gameModel.isFailure, true);
      expect(gameModel.attempts, initialAttempts + 1);
    });

    test('Timeout triggers failure', () async {
      final gameModel = GameModel();
      final initialAttempts = gameModel.attempts;

      // Simulate a timeout
      while (gameModel.timerSeconds > 0) {
        await Future.delayed(const Duration(seconds: 1));
      }

      expect(gameModel.isFailure, true);
      expect(gameModel.attempts, initialAttempts + 1);
    });

    
  });
}