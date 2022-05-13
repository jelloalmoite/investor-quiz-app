import 'package:flutter/material.dart';

class Quiz1 extends StatelessWidget {
  const Quiz1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Personal Finance",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins-ExtraBold',
              fontWeight: FontWeight.w800,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(81, 231, 168, 1),
          elevation: 3, // 0 yung value para mawala yung back shadow sa app bar
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            iconSize: 35,
            color: Colors.black,
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 35),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 15),
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Question No. Line
                      const Text(
                        "Question 1",
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: 'Poppins Medium',
                            fontWeight: FontWeight.w500),
                      ),

                      // Question-Box
                      Container(
                        margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
                        padding: const EdgeInsets.fromLTRB(14, 28, 13, 28),
                        child: const Center(
                          child: Text(
                            " It is a financial plan that helps you to track money, make informed spending decisions and plan for your financial goal.",
                            maxLines: 5,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Lora',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 100),
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

                      //btn 1
                      Container(
                        child: MaterialButton(
                          height: 50,
                          minWidth: 310,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: const BorderSide(
                                color: Color.fromRGBO(5, 195, 107, 100),
                                width: 5),
                          ),
                          child: const Text(
                            "A. Money Tracker ",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () => {},
                          splashColor: Color.fromRGBO(5, 195, 107, 100),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 100),
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

                      const Padding(padding: EdgeInsets.all(5.0)),
                      //btn2
                      Container(
                        child: MaterialButton(
                          height: 50,
                          minWidth: 310,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: const BorderSide(
                                color: Color.fromRGBO(5, 195, 107, 100),
                                width: 5),
                          ),
                          child: const Text(
                            "B. Financial Wallet ",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () => {},
                          splashColor: Color.fromRGBO(5, 195, 107, 100),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 100),
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

                      const Padding(padding: EdgeInsets.all(5.0)),
                      // btn3
                      Container(
                        child: MaterialButton(
                          height: 50,
                          minWidth: 310,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: const BorderSide(
                                color: Color.fromRGBO(5, 195, 107, 100),
                                width: 5),
                          ),
                          child: const Text(
                            "C. Budget ",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () => {},
                          splashColor: Color.fromRGBO(5, 195, 107, 100),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 100),
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

                      const Padding(padding: EdgeInsets.all(5.0)),
                      //btn4
                      Container(
                        child: MaterialButton(
                          height: 50,
                          minWidth: 310,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                            side: const BorderSide(
                                color: Color.fromRGBO(5, 195, 107, 100),
                                width: 5),
                          ),
                          child: const Text(
                            "D. Savings Account ",
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () => {},
                          splashColor: Color.fromRGBO(5, 195, 107, 100),
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(81, 231, 168, 100),
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

                      const Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //back
                          const SizedBox(height: 30),
                          MaterialButton(
                            height: 41.0,
                            minWidth: 100.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(5, 195, 107, 50),
                                  width: 3),
                            ),
                            child: const Text(
                              "BACK ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins Medium',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => {Navigator.pop(context)},
                            splashColor: const Color.fromRGBO(5, 195, 107, 50),
                          ),

                          //skip
                          const SizedBox(height: 30),
                          MaterialButton(
                            height: 41.0,
                            minWidth: 100.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(5, 195, 107, 50),
                                  width: 3),
                            ),
                            child: const Text(
                              "SKIP ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins Medium',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => {},
                            splashColor: const Color.fromRGBO(5, 195, 107, 50),
                          ),

                          //next
                          const SizedBox(height: 30),
                          MaterialButton(
                            height: 41.0,
                            minWidth: 100.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(5, 195, 107, 50),
                                  width: 3),
                            ),
                            child: const Text(
                              "NEXT ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins Medium',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () => {},
                            splashColor: const Color.fromRGBO(5, 195, 107, 50),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
