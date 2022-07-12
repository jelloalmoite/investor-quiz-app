import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:investor_quizapp/pages/settings.dart';
import '/pages/result.dart';
import '/data/questionandanswer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

var quiz = QuestionAnswer(); //place database in a variable
var totalQuizQuest =
    10; //Total no. of questions (connected with result.dart & historyCategory.dart)
var questionNumber = 1; //initialize start of number question
var skipQuestion = 0;
var correctAnswer = 0;
var wrongAnswer = 0;
List<dynamic> questions = [];
List<dynamic> answers = [];
List<dynamic> answersEval = [];
List<dynamic> numQuestion = [];
//for profile data

var timeTaken = [0, 0]; //[min, sec]
//number of skipped question/ correct answer/ wrong answer/ time taken
DateTime dt = DateTime.now();

void reset() {
  questions.removeRange(0, 10);
  answers.removeRange(0, 10);
  answersEval.removeRange(0, 10);
  questionNumber = 1;
  skipQuestion = 0;
  correctAnswer = 0;
  wrongAnswer = 0;
  timeTaken = [0, 0];
}

class Quiz extends StatefulWidget {
  final String y, titl;
  const Quiz({Key? mykey, required this.y, required this.titl})
      : super(key: mykey);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late final AssetsAudioPlayer _assetsAudioPlayerQuiz = AssetsAudioPlayer();

  void startBgMusic() {
    _assetsAudioPlayerQuiz.open(
      Audio('assets/music/Progress.mp3'),
      autoStart: true,
      loopMode: LoopMode.single,
      volume: 0.5,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
    );
  }

  //Generate random number from 0 to number of question
  int randomNumber = Random().nextInt(2);
  //widget for choices
  Widget choose(String abcd, int x) {
    return Container(
      child: MaterialButton(
        height: 50,
        minWidth: 310,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          side: const BorderSide(
              color: Color.fromRGBO(5, 195, 107, 100), width: 5),
        ),
        child: AutoSizeText(
          abcd, //display choices from a to d
          //textAlign: TextAlign.left,
          maxLines: 1,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        //onpress button for choices
        onPressed: () {
          questions.add(quiz.tanong[int.parse(widget.y)][randomNumber]);
          numQuestion.add(quiz.tanong[int.parse(widget.y)][randomNumber] + "-");
          answers.add(quiz.sagot[int.parse(widget.y)][randomNumber][x]);
          answersEval.add(quiz.tama[int.parse(widget.y)][randomNumber]);
          if (quiz.sagot[int.parse(widget.y)][randomNumber][x] ==
              quiz.tama[int.parse(widget.y)][randomNumber]) {
            correctAnswer++;
            debugPrint("correct" + correctAnswer.toString());
          } else {
            wrongAnswer++;
            debugPrint("wrong" + wrongAnswer.toString());
          }
          //Canceltimer timer
          canceltimer = true;
          //call a function after clicking any button
          updateQuestion();
        },
        splashColor: const Color.fromRGBO(5, 195, 107, 100),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(81, 231, 168, 100),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(81, 231, 168, 45),
            offset: Offset(
              -3.0,
              4.0,
            ),
            blurRadius: 10.0,
          ),
        ],
      ),
    );
  }

//initialization for timer
  bool canceltimer = false;
  int timeLeft = 30;
  var timestring = "30";

  @override
  void initState() {
    super.initState();
    starttimer();
    if (status == true) {
      startBgMusic();
    }
  }

  @override
  void dispose() {
    _assetsAudioPlayerQuiz.dispose();
    print('dispose');
    super.dispose();
  }

//timer countdown function
  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (canceltimer == true) {
          t.cancel();
        } else if (timeLeft < 1) {
          questions.add(quiz.tanong[int.parse(widget.y)][randomNumber]);
          numQuestion.add(quiz.tanong[int.parse(widget.y)][randomNumber] + "-");
          answers.add("None");
          answersEval.add(quiz.tama[int.parse(widget.y)][randomNumber]);
          skipQuestion++;
          debugPrint("skip" + skipQuestion.toString());
          t.cancel();
          updateQuestion();
          starttimer();
        } else {
          timeLeft--;
          timeTaken[1]++;
          if (timeTaken[1] == 60) {
            timeTaken[1] = 0;
            timeTaken[0]++;
          }
        }
        timestring = timeLeft.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: AutoSizeText(
              widget.titl.replaceAll("_", " "),
              maxLines: 2,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Poppins-ExtraBold',
                fontWeight: FontWeight.w800,
                height: 0.8,
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromRGBO(81, 231, 168, 1),
            elevation: 3,
            actions: [
              //Display timer
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(83, 215, 80, 0.3),
                    border: Border.all(
                        color: Color.fromRGBO(5, 195, 107, 100), width: 4.0),
                    shape: BoxShape.circle,
                  ),
                  height: 50.0,
                  width: 50.0,
                  child: Center(
                    child: Text(
                      timestring,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 35),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Display question number
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Text(
                      "Question $questionNumber",
                      style: const TextStyle(
                          fontSize: 21,
                          fontFamily: 'Poppins Medium',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 15),
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Question-Box
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 20.0),
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          child: Center(
                            child: AutoSizeText(
                              quiz.tanong[int.parse(widget.y)][randomNumber],
                              maxLines: 6,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Lora',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(81, 231, 168, 100),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(81, 231, 168, 45),
                                offset: Offset(
                                  -3.0,
                                  4.0,
                                ),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                        ),
                        //display all choices

                        for (int x = 0;
                            x <
                                quiz.sagot[int.parse(widget.y)][randomNumber]
                                    .length;
                            x++) ...[
                          //call widget for choices and pass 2 parameters

                          choose(
                              quiz.sagot[int.parse(widget.y)][randomNumber][x],
                              x),
                          const Padding(padding: EdgeInsets.all(5.0))
                        ],
                      ],
                    ),
                  ),
                  //Skip button
                  MaterialButton(
                    height: 35.0,
                    minWidth: 120.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                          color: Color.fromRGBO(5, 195, 107, 50), width: 3),
                    ),
                    child: const Text(
                      "SKIP ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins Medium',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    //onpress for skip button
                    onPressed: () => {
                      questions
                          .add(quiz.tanong[int.parse(widget.y)][randomNumber]),
                      numQuestion.add(
                          quiz.tanong[int.parse(widget.y)][randomNumber] + "-"),
                      answers.add("None"),
                      answersEval
                          .add(quiz.tama[int.parse(widget.y)][randomNumber]),
                      //Generate random number from 0 to number of question
                      randomNumber = Random()
                          .nextInt(quiz.tanong[int.parse(widget.y)].length),
                      skipQuestion++,
                      debugPrint("skip" + skipQuestion.toString()),
                      //call a function after clicking any button
                      updateQuestion(),
                    },
                    splashColor: const Color.fromRGBO(5, 195, 107, 50),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void updateQuestion() {
    setState(() {
      final categorybox = Hive.box("Profile_data");
      print(categorybox.length.toString());
      if (questionNumber < totalQuizQuest) {
        questionNumber++;
        canceltimer = false;
        timeLeft = 30; //delay display 10

        //proceed to next question
        randomNumber =
            Random().nextInt(quiz.tanong[int.parse(widget.y)].length);

        //Proceed to the result page
      } else if (questionNumber == totalQuizQuest) {
        Hive.openBox(widget.titl);
        print(numQuestion.length.toString());
        print(correctAnswer.toString());
        print(skipQuestion.toString());
        print(wrongAnswer.toString());

        if (categorybox.length == 0) {
          categorybox.put('Personal_FinancenumQuestion', 0);
          categorybox.put('Personal_FinancenumCorrect', 0);
          categorybox.put('Personal_FinancenumWrong', 0);
          categorybox.put('Personal_FinancenumSkip', 0);
          categorybox.put('Investment_and_Portfolio_ManagementnumQuestion', 0);
          categorybox.put('Investment_and_Portfolio_ManagementnumCorrect', 0);
          categorybox.put('Investment_and_Portfolio_ManagementnumWrong', 0);
          categorybox.put('Investment_and_Portfolio_ManagementnumSkip', 0);
          categorybox.put('Behavioral_FinancenumQuestion', 0);
          categorybox.put('Behavioral_FinancenumCorrect', 0);
          categorybox.put('Behavioral_FinancenumWrong', 0);
          categorybox.put('Behavioral_FinancenumSkip', 0);
          categorybox.put('Capital_MarketnumQuestion', 0);
          categorybox.put('Capital_MarketnumCorrect', 0);
          categorybox.put('Capital_MarketnumWrong', 0);
          categorybox.put('Capital_MarketnumSkip', 0);
          categorybox.put('correctHighest', correctAnswer);
          categorybox.put('correctLowest', correctAnswer);
          categorybox.put('timeHighestM', timeTaken[0]);
          categorybox.put('timeHighestS', timeTaken[1]);
          categorybox.put('timeLowestM', timeTaken[0]);
          categorybox.put('timeLowestS', timeTaken[1]);
          categorybox.put("totalScore", correctAnswer);
          categorybox.put("totalAttempt", 1);
        } else {
          categorybox.put(
              'totalScore', categorybox.get('totalScore') + correctAnswer);
          categorybox.put('totalAttempt', categorybox.get('totalAttempt') + 1);
        }

        if (widget.titl == "Personal_Finance") {
          categorybox.put('Personal_FinancenumQuestion',
              categorybox.get('Personal_FinancenumQuestion') + 10);
          categorybox.put('Personal_FinancenumCorrect',
              categorybox.get('Personal_FinancenumCorrect') + correctAnswer);
          categorybox.put('Personal_FinancenumWrong',
              categorybox.get('Personal_FinancenumWrong') + wrongAnswer);
          categorybox.put('Personal_FinancenumSkip',
              categorybox.get('Personal_FinancenumSkip') + skipQuestion);
        } else if (widget.titl == "Investment_and_Portfolio_Management") {
          categorybox.put(
              'Investment_and_Portfolio_ManagementnumQuestion',
              categorybox
                      .get('Investment_and_Portfolio_ManagementnumQuestion') +
                  10);
          categorybox.put(
              'Investment_and_Portfolio_ManagementnumCorrect',
              categorybox.get('Investment_and_Portfolio_ManagementnumCorrect') +
                  correctAnswer);
          categorybox.put(
              'Investment_and_Portfolio_ManagementnumWrong',
              categorybox.get('Investment_and_Portfolio_ManagementnumWrong') +
                  wrongAnswer);
          categorybox.put(
              'Investment_and_Portfolio_ManagementnumSkip',
              categorybox.get('Investment_and_Portfolio_ManagementnumSkip') +
                  skipQuestion);
        } else if (widget.titl == "Behavioral_Finance") {
          categorybox.put('Behavioral_FinancenumQuestion',
              categorybox.get('Behavioral_FinancenumQuestion') + 10);
          categorybox.put('Behavioral_FinancenumCorrect',
              categorybox.get('Behavioral_FinancenumCorrect') + correctAnswer);
          categorybox.put('Behavioral_FinancenumWrong',
              categorybox.get('Behavioral_FinancenumWrong') + wrongAnswer);
          categorybox.put('Behavioral_FinancenumSkip',
              categorybox.get('Behavioral_FinancenumSkip') + skipQuestion);
        } else if (widget.titl == "Capital_Market") {
          categorybox.put('Capital_MarketnumQuestion',
              categorybox.get('Capital_MarketnumQuestion') + 10);
          categorybox.put('Capital_MarketnumCorrect',
              categorybox.get('Capital_MarketnumCorrect') + correctAnswer);
          categorybox.put('Capital_MarketnumWrong',
              categorybox.get('Capital_MarketnumWrong') + wrongAnswer);
          categorybox.put('Capital_MarketnumSkip',
              categorybox.get('Capital_MarketnumSkip') + skipQuestion);
        }
        //time condition
        var x = (timeTaken[0] * 60) + timeTaken[1];
        print(x.toString());
        var y = ((categorybox.get('timeHighestM') * 60) +
            categorybox.get('timeHighestS'));
        print(y.toString());
        var z = ((categorybox.get('timeLowestM') * 60) +
            categorybox.get('timeLowestS'));
        print(z.toString());
        if (x >= y) {
          categorybox.put('timeHighestM', timeTaken[0]);
          categorybox.put('timeHighestS', timeTaken[1]);
        } else if (x <= z) {
          categorybox.put('timeLowestM', timeTaken[0]);
          categorybox.put('timeLowestS', timeTaken[1]);
        }
        //correctanswer condition
        var xx = categorybox.get('correctHighest');
        var yy = categorybox.get('correctLowest');
        if (correctAnswer >= xx) {
          categorybox.put('correctHighest', correctAnswer);
        } else if (correctAnswer <= yy) {
          categorybox.put('correctLowest', correctAnswer);
        }

        final _historybox = Hive.box(widget.titl);
        //add value to box
        Future<void> _createItem(Map<String, dynamic> newItem) async {
          await _historybox.add(newItem);
        }

        _createItem({
          "title": widget.titl.toString(),
          "questions": numQuestion.toString(),
          "answers": answers.toString(),
          "correctAnswer": answersEval.toString(),
          "numCorrect": correctAnswer.toString(),
          "numWrong": wrongAnswer.toString(),
          "numSkipped": skipQuestion.toString(),
          "timeTaken": timeTaken[0].toString() +
              "mins " +
              timeTaken[1].toString() +
              "secs",
          "date": dt.month.toString() +
              "-" +
              dt.day.toString() +
              "-" +
              dt.year.toString()
        });

        canceltimer = true;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Result(
                      quizResult: [
                        correctAnswer,
                        wrongAnswer,
                        skipQuestion,
                        timeTaken[0],
                        timeTaken[1]
                      ],
                      title: widget.titl.replaceAll("_", " "),
                    )));
      }
    });
  }
}
