import 'package:qizzler/model/question.dart';

class QuizBrain {
  int _index = 0;

  final List<Question> _quizBrain = [
    Question(
        question: 'Barack Obama is the 44th President of the United States?',
        answer: true),
    Question(
        question: 'In order to be a leader you must have followers?',
        answer: false),
    Question(
        question:
            'IPeople who have a college degree earn more money than non-degree holders?',
        answer: false),
    Question(
        question: 'The sun rises in the East and sets in the West?',
        answer: true),
    Question(
        question:
            'Christmas day is December 25th in the United States of America?',
        answer: true),
    Question(
        question: 'Only 5% of the population has a doctoral degree?',
        answer: false),
    Question(
        question:
            'It is a leader\'s job to motivate people to perform their best work?',
        answer: false),
    Question(
        question:
            'The most significant role model in a young girl\'s life is her mother?',
        answer: false),
    Question(
        question:
            'Leadership is an inborn skill that some people have and others don\'t?',
        answer: false),
    Question(question: 'Teenagers are rebellious?', answer: false),
  ];

  getQuestion() {
    return _quizBrain[_index].question;
  }

  getAnswer() {
    return _quizBrain[_index].answer;
  }

  isFinished() {
    return _index >= _quizBrain.length - 1 ? true : false;
  }

  resetQuestion() {
    _index = 0;
  }

  nextQuestion() {
    if (_index != _quizBrain.length - 1) ++_index;
  }
}
