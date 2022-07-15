class Quiz {
  int _currentScore = 0;
  int _totalAttempts = 0;

  int get currentScore => _currentScore;
  int get totalAttempts => _totalAttempts;

  markAnswerCorrect() {
    _currentScore++;
    _totalAttempts++;
  }

  markAnswerWrong() {
    _totalAttempts++;
  }

  resetQuiz() {
    _totalAttempts = 0;
    _currentScore = 0;
  }
}
