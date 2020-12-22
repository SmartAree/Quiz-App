import 'QuesAns.dart';

class QuizBrain {

  int _quesNumb = 0; //private

  List<QuesAns> _questionBank = [ //_questionBank //this is private now
    QuesAns(q: 'An octopus has five hearts?', a: false),
    QuesAns(q: 'Nicolas Cage and Michael Jackson both married the same woman?', a: true),
    QuesAns(q: 'Donald Duck’s middle name is Fauntleroy?', a: true,),
    QuesAns(q: 'The Statue of Liberty was a gift from France?', a: true),
    QuesAns(q: 'A metre is further than a yard?', a: true),
    QuesAns(q: 'The currency of France is the Franc?', a: true),
    QuesAns(q: 'A woman has walked on the moon?', a: false),
    QuesAns(q: 'The capital of Libya is Benghazi?', a: true),
  ];

  //stops our app to get crash after last question.
 void nextQues(){
   if (_quesNumb < _questionBank.length - 1){
     _quesNumb++;

   }

 }



String toGetquestion (){
  return _questionBank[_quesNumb].ques;
}

bool toGetanswer(){
  return _questionBank[_quesNumb].ans;
}


//a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.
  bool isFinished() {
    if (_quesNumb >= _questionBank.length - 1) {
      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _quesNumb = 0;
  }
    }

