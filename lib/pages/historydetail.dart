import 'package:flutter/material.dart';
import '/pages/history.dart';

class Details extends StatefulWidget {
  const Details(
      {Key? mykey,
      required this.historyQuestion,
      required this.historyAnswers,
      required this.historyCorrect})
      : super(key: mykey);
  final historyQuestion, historyAnswers, historyCorrect;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Widget display(int num, Color colors) {
    return Container(
      height: 250.0,
      width: 320.0,
      child: Center(
        child: RichText(
          maxLines: 9,
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Question " + (num + 1).toString() + ":",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w600,
                  height: 2,
                ),
              ),
              TextSpan(
                text: widget.historyQuestion[num],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
              TextSpan(
                text: "\nYour Answer: " + widget.historyAnswers[num],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w600,
                  height: 2,
                ),
              ),
              TextSpan(
                text: "\nCorrect Answer: " + widget.historyCorrect[num],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w600,
                  height: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: colors,
            offset: Offset(
              -3.0,
              4.0,
            ),
            blurRadius: 5.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "RESULT",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins-ExtraBold',
              fontWeight: FontWeight.w800,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            iconSize: 35,
            color: Colors.black,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
          actions: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: 50,
            ),
            SizedBox(
              width: 15,
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            children: <Widget>[
              for (int a = 0; a < 10; a++) ...[
                if (widget.historyAnswers[a].toString() ==
                    widget.historyCorrect[a].toString()) ...[
                  display(a, const Color.fromRGBO(5, 195, 107, 0.38)),
                  SizedBox(height: 16),
                ] else if (widget.historyAnswers[a].toString() == "None") ...[
                  display(a, const Color.fromRGBO(240, 243, 60, 100)),
                  SizedBox(height: 16),
                ] else if (widget.historyAnswers[a].toString() !=
                    widget.historyCorrect[a].toString()) ...[
                  display(a, const Color.fromRGBO(243, 83, 86, 100)),
                  SizedBox(height: 16),
                ]
              ],
            ]),
      );
}
