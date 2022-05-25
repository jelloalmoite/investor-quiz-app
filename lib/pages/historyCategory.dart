import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '/data/personalHistory.dart';
import '/pages/quiz.dart';

class HistoryCategory extends StatefulWidget {
  final String category;
  const HistoryCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<HistoryCategory> createState() => _HistoryCategoryState();
}

class _HistoryCategoryState extends State<HistoryCategory> {
  get categoryN => widget.category;
  List<Widget> historyData = [];

  String scorePercent(int correct) {
    var percent = (correct / totalQuizQuest) * 100;
    return percent.round().toString() + "%";
  }

  //====================Card Generator
  void getPostsData() {
    List<dynamic> responseList =
        PERSONAL_HISTORY; //pwedeng paltan to para sa ibang categories
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(
        Column(
          children: [
            SizedBox(height: 5),
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
                            percent: post["correct"] / totalQuizQuest,
                            center: Text(
                              scorePercent(post["correct"]),
                              style: TextStyle(
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30.0),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color.fromRGBO(5, 195, 107, 100),
                            backgroundColor: Color.fromRGBO(83, 215, 80, 0.3),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 120,
                          height: 30,
                          child: MaterialButton(
                            color: const Color.fromRGBO(81, 231, 168, 1),
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
                            onPressed: () => {},
                            splashColor: const Color.fromRGBO(5, 195, 107, 100),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
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
                          post["time"],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //==========================Correct
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      post["correct"].toString(),
                                      style: TextStyle(
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
                            SizedBox(width: 12),
                            //==========================Skipped
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      post["skip"].toString(),
                                      style: TextStyle(
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
                            SizedBox(width: 12),
                            //==========================Wrong
                            Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      post["wrong"].toString(),
                                      style: TextStyle(
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
            SizedBox(height: 5),
          ],
        ),
      );
    });
    setState(() {
      historyData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'HISTORY',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins-ExtraBold',
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Image.asset("assets/images/logo.png"),
          ],
        ),
        body: Container(
          height: size.height,
          margin: const EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 35),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Overview of $categoryN",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(6.0)),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: historyData.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return historyData[index];
                      }

                      // //String time, int correct, int skip, int wrong
                      // History(8, '1 min', 1, 1, 1, 1),
                      // const SizedBox(height: 10),
                      // History(4, '10 min 30 secs', 2, 10, 10, 10),
                      // const SizedBox(height: 10),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
