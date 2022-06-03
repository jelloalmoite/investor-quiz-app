import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget category(String image, String title, Color color, VoidCallback func) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: func,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 90,
          width: 310,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: <Widget>[
              Image(
                image: AssetImage(image),
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 12),
              Container(
                width: 200,
                child: Text(
                  title,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 4.0,
                    height: 0.9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color.fromRGBO(81, 231, 168, 1),
        appBar: AppBar(
          title: const Text(
            "PROFILE",
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
            SizedBox(
              width: 15,
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 20),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Tzuyu Chou",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                          TextSpan(
                            text: "\nchoutzuyu@gmail.com",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1),
                          ),
                        ]),
                      ),
                    ]),
                const SizedBox(height: 8.0),
                const Padding(padding: EdgeInsets.all(6.0)),

                //White Box
                Container(
                  height: 410,
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Column(
                    children: [
                      //Score & Attempts Box
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //=====Score
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.star_border_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'SCORE',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 1.1),
                                      ),
                                    ]),
                              ),
                              //=====Divider
                              Container(
                                height: 70,
                                width: 4,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              //=====Attempts
                              SizedBox(
                                height: 90,
                                width: 90,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.restart_alt_outlined,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'ATTEMPTS',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '12',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontFamily: 'Poppins-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 1.1),
                                      ),
                                    ]),
                              ),
                            ]),
                      ),
                      Container(
                        height: 260,
                        child: ListView(children: <Widget>[
                          //Accuracy
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Accuracy:",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w600,
                                    )),
                              ]),
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircularPercentIndicator(
                                  radius: 85.0,
                                  lineWidth: 9.0,
                                  animation: true,
                                  percent: 0.5,
                                  center: Text(
                                    "50%",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      Color.fromRGBO(5, 195, 107, 100),
                                  backgroundColor:
                                      Color.fromRGBO(83, 215, 80, 0.3),
                                ),
                                const SizedBox(width: 8.0),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Highest: 12/20",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "\nLowest: 2/20",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ]),
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Average Time:",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Poppins-Medium',
                                      fontWeight: FontWeight.w600,
                                    )),
                              ]),
                          //Average Time
                          const SizedBox(height: 10.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircularPercentIndicator(
                                  radius: 85.0,
                                  lineWidth: 9.0,
                                  animation: true,
                                  percent: 0.5,
                                  center: Text(
                                    "50%",
                                    style: TextStyle(
                                        fontFamily: 'Poppins-SemiBold',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor:
                                      Color.fromRGBO(5, 195, 107, 100),
                                  backgroundColor:
                                      Color.fromRGBO(83, 215, 80, 0.3),
                                ),
                                const SizedBox(width: 8.0),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Max: 02:30 sec",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(
                                      text: "\nMin: 01:30 sec",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                                ),
                              ]),
                          const SizedBox(height: 15.0),
                          const Text("Category Stats:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(height: 15),
                          category(
                              "assets/images/personal_finance.png",
                              "Personal Finance",
                              const Color.fromRGBO(83, 215, 80, 75),
                              () => {print("asd")}),
                          const SizedBox(height: 10),
                          category(
                              "assets/images/investment_and_portfolio_management.png",
                              "Investment and Portfolio Management",
                              const Color.fromRGBO(103, 81, 239, 81),
                              () => {print("asd")}),
                          const SizedBox(height: 10),
                          category(
                              "assets/images/behavioral_finance.png",
                              "Behavioral Finance",
                              const Color.fromRGBO(255, 78, 109, 90),
                              () => {print("asd")}),
                          const SizedBox(height: 10),
                          category(
                              "assets/images/capital_markets.png",
                              "Capital Markets",
                              const Color.fromRGBO(255, 147, 81, 1),
                              () => {print("asd")}),
                        ]),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
              ]),
        ),
      );
}
