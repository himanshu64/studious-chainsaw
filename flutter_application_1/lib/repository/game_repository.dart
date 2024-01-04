class GameRepository {
  int _score = 0;
  int _attempts = 0;

  int get score => _score;
  int get attempts => _attempts;

  Future<bool> checkGuess(int randomNumber, int tappedSeconds) async {
    await Future.delayed(const Duration(seconds: 1));

    _attempts++;

    if (randomNumber == tappedSeconds % 60) {
      _score++;
      return true;
    } else {
      return false;
    }
  }

  void resetScore() {
    _score = 0;
    _attempts = 0;
  }

  void incrementScore() {
    _score++;
  }
}
