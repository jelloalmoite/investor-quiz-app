import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/pages/quiz.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '/pages/historydetail.dart';

class HistoryPage extends StatefulWidget {
  final String category;
  const HistoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    Hive.openBox(widget.category);
    final _historybox = Hive.box(widget.category);
    print(widget.category);
    super.initState();

    final data = _historybox.keys.map((key) {
      final value = _historybox.get(key);
      return {
        "key": key,
        "title": value['title'],
        "questions": value['questions'],
        "answers": value['answers'],
        "correctAnswer": value['correctAnswer'],
        "numCorrect": value['numCorrect'],
        "numWrong": value['numWrong'],
        "numSkipped": value['numSkipped'],
        "timeTaken": value['timeTaken'],
        "date": value['date']
      };
    }).toList();
    _items = data.reversed.toList();
  }

  // Get all items from the database

  void tohistoryDetails(dynamic q, dynamic a, dynamic c) {
    q = q.replaceAll("]", " "); //remove last char ]
    a = a.replaceAll("]", " ");
    c = c.replaceAll("]", " ");
    var Q = ((q.replaceAll("[", " ")).split('-,')); //remove first char [
    var A = ((a.replaceAll("[", " ")).split(','));
    var C = ((c.replaceAll("[", " ")).split(','));
    print(Q);
    print(A);
    print(C);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Details(
              historyQuestion: Q, historyAnswers: A, historyCorrect: C)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: _items.length,
              itemBuilder: (_, index) {
                final currentItem = _items[index];
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    Material(
                      borderRadius: BorderRadius.circular(15),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: CircularPercentIndicator(
                                    radius: 120.0,
                                    lineWidth: 12.0,
                                    animation: true,
                                    percent:
                                        int.parse(currentItem['numCorrect']) /
                                            totalQuizQuest,
                                    center: Text(
                                      ((int.parse(currentItem['numCorrect']) /
                                                  10) *
                                              100)
                                          .toString(),
                                      style: const TextStyle(
                                          fontFamily: 'Poppins-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30.0),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor:
                                        const Color.fromRGBO(5, 195, 107, 100),
                                    backgroundColor:
                                        const Color.fromRGBO(83, 215, 80, 0.3),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: MaterialButton(
                                    color:
                                        const Color.fromRGBO(81, 231, 168, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Text(
                                      "Details",
                                      style: TextStyle(
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    onPressed: () => {
                                      tohistoryDetails(
                                          currentItem['questions'],
                                          currentItem['answers'],
                                          currentItem['correctAnswer'])
                                    },
                                    splashColor:
                                        const Color.fromRGBO(5, 195, 107, 100),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              children: <Widget>[
                                const Text(
                                  "Time Taken:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                Text(
                                  currentItem['timeTaken'].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    //==========================Correct
                                    Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentItem['numCorrect'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Poppins-Medium',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            "Correct",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-Medium',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 12),
                                    //==========================Skipped
                                    Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentItem['numSkipped'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Poppins-Medium',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            "Skipped",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-Medium',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 12),
                                    //==========================Wrong
                                    Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              currentItem['numWrong'],
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Poppins-Medium',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Center(
                                          child: Text(
                                            "Wrong",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-Medium',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    //=========date
                                    Row(
                                      children: [
                                        Center(
                                          child: Text(
                                            currentItem["date"],
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins-Medium',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
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
                    ),
                    const SizedBox(height: 5),
                  ],
                );
              }),
    );
  }
}
