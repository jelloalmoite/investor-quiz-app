import 'package:flutter/material.dart';

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
  Widget display(int num, Color cardColor, IconData icon, String title,
      Color titleBgColor, Color titleTxtColor) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question " + (num + 1).toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontFamily: 'Poppins-Medium',
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                Container(
                  height: 40,
                  width: 130,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 25, color: titleTxtColor),
                      SizedBox(width: 5),
                      Text(title,
                          style: TextStyle(
                            color: titleTxtColor,
                            fontSize: 17,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: titleBgColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            RichText(
              //maxLines: 9,
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.historyQuestion[num],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "\nYour Answer: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),
                  TextSpan(
                    text: widget.historyAnswers[num],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                  TextSpan(
                    text: "\nCorrect Answer: ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w600,
                      height: 2,
                    ),
                  ),
                  TextSpan(
                    text: widget.historyCorrect[num],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontFamily: 'Lora',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
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
                  display(
                    a,
                    const Color.fromRGBO(5, 195, 107, 0.38),
                    Icons.done_rounded,
                    "Correct",
                    const Color.fromRGBO(5, 195, 107, 1),
                    Colors.white,
                  ),
                  SizedBox(height: 16),
                ] else if (widget.historyAnswers[a].toString() == " None" ||
                    widget.historyAnswers[a].toString() == " None ") ...[
                  display(
                      a,
                      const Color.fromRGBO(240, 243, 60, 0.5),
                      Icons.warning_rounded,
                      "Skipped",
                      const Color.fromRGBO(240, 243, 60, 1),
                      Colors.black),
                  SizedBox(height: 16),
                ] else if (widget.historyAnswers[a].toString() !=
                    widget.historyCorrect[a].toString()) ...[
                  display(
                      a,
                      const Color.fromRGBO(243, 83, 86, 0.6),
                      Icons.close_rounded,
                      "Wrong",
                      const Color.fromRGBO(243, 83, 86, 1),
                      Colors.white),
                  SizedBox(height: 16),
                ]
              ],
            ]),
      );
}
