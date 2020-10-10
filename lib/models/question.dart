enum Type { multiple, boolean }

enum Difficulty { easy, medium, hard }

class Question {
  final String categoryName;
  final Type type;
  final Difficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question(
      {this.categoryName,
      this.type,
      this.difficulty,
      this.question,
      this.correctAnswer,
      this.incorrectAnswers});
}
