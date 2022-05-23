import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);
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
            Container(
              height: 250.0,
              width: 320.0,
              child: Center(
                child: RichText(
                  maxLines: 9,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Question 1",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\nIt is a financial plan that helps you to track money, make informed spending decisions and plan for your financial goal",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: "\nYour Answer: You didn't select answer",
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
                color: Color.fromRGBO(5, 195, 107, 0.38),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(81, 231, 168, 45),
                    offset: Offset(
                      -3.0,
                      4.0,
                    ),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 250.0,
              width: 320.0,
              child: Center(
                child: RichText(
                  maxLines: 9,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Question 2",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\nIt is a financial plan that helps you to track money, make informed spending decisions and plan for your financial goal",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: "\nYour Answer: You didn't select answer",
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
                color: Color.fromRGBO(5, 195, 107, 0.38),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(81, 231, 168, 45),
                    offset: Offset(
                      -3.0,
                      4.0,
                    ),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 250.0,
              width: 320.0,
              child: Center(
                child: RichText(
                  maxLines: 9,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Question 3",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w600,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text:
                            "\nIt is a financial plan that helps you to track money, make informed spending decisions and plan for your financial goal",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 2,
                        ),
                      ),
                      TextSpan(
                        text: "\nYour Answer: You didn't select answer",
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
                color: Color.fromRGBO(5, 195, 107, 0.38),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(81, 231, 168, 45),
                    offset: Offset(
                      -3.0,
                      4.0,
                    ),
                    blurRadius: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
