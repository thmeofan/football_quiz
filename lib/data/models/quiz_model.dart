class Question {
  final String text;
  final String category;
  // final Category;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.category,
    required this.text,
    // required this.Category,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

// enum Category { rules, teams, players, clubHistory }

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}
