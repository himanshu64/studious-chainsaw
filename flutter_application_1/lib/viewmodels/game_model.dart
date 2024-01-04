import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/game_repository.dart';

class GameModel extends ChangeNotifier {
  int _timerSeconds = 5;
  int _randomNumber = 0;

  Timer? _timer;

  final GameRepository _repository = GameRepository();

  bool _isSuccess = false;
  bool _isFailure = false;
  String _failureMessage = '';

  GameModel() {
    _startTimer();
  }

  int get timerSeconds => _timerSeconds;
  int get score => _repository.score;
  int get attempts => _repository.attempts;
  int get randomNumber => _randomNumber;
  bool get isSuccess => _isSuccess;
  bool get isFailure => _isFailure;
  String get failureMessage => _failureMessage;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        _timerSeconds--;
      } else {
        _handleTimeout();
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _timerSeconds = 5;
    notifyListeners();
  }

  void generateRandomNumber() {
    _randomNumber = _getRandomNumber();
    notifyListeners();
  }

  Future<void> onTap() async {
    generateRandomNumber();

    bool isSuccessful = await _repository.checkGuess(_randomNumber, DateTime.now().second);

    if (isSuccessful) {
      _handleSuccess();
    } else {
      _handleFailure("Oops! Wrong guess.");
    }

    resetTimer();
  }

  void _handleSuccess() {
    _isSuccess = true;
    _isFailure = false;
    _repository.incrementScore();
    // _repository.resetScore();
    resetTimer();
    notifyListeners();
  }

  void _handleFailure(String message) {
    _isSuccess = false;
    _isFailure = true;
    _failureMessage = message;
    resetTimer();
    notifyListeners();

  }

  void _handleTimeout() {
    _handleFailure("Sorry! Timeout and one attempt is considered for failure as penalty");
  }

  int _getRandomNumber() {
    return DateTime.now().millisecond % 60;
  }
}
