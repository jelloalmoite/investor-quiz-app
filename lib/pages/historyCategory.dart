import 'package:flutter/material.dart';
import '/pages/history.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hive/hive.dart';
import '/pages/quiz.dart';

class HistoryPages extends StatefulWidget {
  const HistoryPages({Key? key}) : super(key: key);

  @override
  State<HistoryPages> createState() => _HistoryPagesState();
}

class _HistoryPagesState extends State<HistoryPages> {
  cardIcon(String title) {
    Icon unlocked = const Icon(Icons.lock_open_rounded, size: 30);

    if (title == 'Personal Finance') {
      return unlocked;
    } else if (title == 'Investment and Portfolio Management' &&
        catLevel >= 100) {
      return unlocked;
    } else if (title == 'Behavioral Finance' && catLevel >= 200) {
      return unlocked;
    } else if (title == 'Capital Markets' && catLevel >= 300) {
      return unlocked;
    } else {
      return const Icon(Icons.lock_rounded, size: 30);
    }
  }

  double indicator(String title) {
    if (title == 'PF') {
      return (catLevel / 100).toDouble();
    } else if (title == 'IPM' && catLevel >= 100) {
      return ((catLevel - 100) / 100).toDouble();
    } else if (title == 'BF' && catLevel >= 200) {
      return ((catLevel - 200) / 100).toDouble();
      ;
    } else if (title == 'CM' && catLevel >= 300) {
      return ((catLevel - 300) / 100).toDouble();
      ;
    } else {
      return 0.0;
    }
  }

  //Category history builder
  Widget history(double progress, String title, int attempts,
      BuildContext context, String databaseName) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 7.0,
                    animation: true,
                    percent: progress,
                    center: cardIcon(title),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color.fromRGBO(5, 195, 107, 100),
                    backgroundColor: const Color.fromRGBO(83, 215, 80, 0.3),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.3, 1),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontFamily: 'Poppins-SemiBold',
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: '\nQuizzes Attempted: $attempts',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(1.1, 1),
                child: SizedBox(
                  height: 60,
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: Color.fromRGBO(5, 195, 107, 100), size: 45),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color.fromRGBO(5, 195, 107, 50),
              width: 3,
            ),
          ),
        ),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HistoryPage(
                      category: databaseName,
                    )),
          )
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "HISTORY",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins-ExtraBold',
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: 50,
            ),
            const SizedBox(width: 15),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 35),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    "Choose a topic to view history.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),

                //============Personal Finance
                history(
                    indicator('PF'),
                    'Personal Finance',
                    Hive.box("Personal_Finance").length,
                    context,
                    'Personal_Finance'),

                //============Investment and Portfolio Management
                history(
                    indicator('IPM'),
                    'Investment and Portfolio Management',
                    Hive.box("Investment_and_Portfolio_Management").length,
                    context,
                    'Investment_and_Portfolio_Management'),

                //============Behavioral Finance
                history(
                    indicator('BF'),
                    'Behavioral Finance',
                    Hive.box("Behavioral_Finance").length,
                    context,
                    'Behavioral_Finance'),

                //============Capital Markets
                history(
                    indicator('CM'),
                    'Capital Markets',
                    Hive.box("Capital_Market").length,
                    context,
                    'Capital_Market'),
              ],
            ),
          ),
        ),
      );
}
