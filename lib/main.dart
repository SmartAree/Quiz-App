import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      debugShowCheckedModeBanner: false,
      home: QuizzlerApp()
    );
  }
}

// ignore: must_be_immutable
class QuizzlerApp extends StatefulWidget {

  @override
  _QuizzlerAppState createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  List<Icon> scorekeeper = [];

  // ignore: non_constant_identifier_names
  void CheckAns(bool userPickedAns){
    bool correctAns = quizBrain.toGetanswer();

    setState(() {
      //Use IF/ELSE to check if we've reached the end of the quiz. If so,On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
    if(quizBrain.isFinished() == true) {
      //show an alert using rFlutter_alert,
      //This is the code for the basic alert from the docs for rFlutter Alert:
      //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();


//Modified for our purposes:
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
      ).show();

      //reset the questionNumber,
      quizBrain.reset();

      //empty out the scoreKeeper.
      scorekeeper = [];
    }

    //If we've not reached the end, ELSE do the answer checking steps below
    else{
      if (userPickedAns == correctAns) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQues();
    }
    });
    }

  int quesNumb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Quizzler App',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Satisfy',
              fontSize: 25.0,
              letterSpacing: 2.5
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment(0.8, 0.2),
              // 10% of the width, so there are ten blinds.
              colors: [
                const Color(0xff355C7D),
                const Color(0xff6C5B7B),
                const Color(0xffC06C84)
              ],
              tileMode: TileMode.clamp, // repeats the gradient over the canva
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 5,
              child: Center(
                child: Text(quizBrain.toGetquestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: 'Satisfy',
                  ),),
              ),
              ),
              Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: FlatButton(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(50)
                   ),
                   child: Text('True',
                     style: TextStyle(
                       color: Colors.green,
                       fontSize: 24.0,
                       fontWeight: FontWeight.w700
                   ),),
                   color: Colors.black54,
                   onPressed: (){CheckAns(true);},

                 ),
               ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text('False',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700
                      ),),
                    color: Colors.red,
                    onPressed: (){ CheckAns(false);},
                  ),
                ),
              ),
              Row(
                children: scorekeeper,
              )
            ],
          ),
        ),
      ),
    );
  }
}

