import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/pages/profile.dart';
import '/pages/categorypage.dart';
import 'package:hive_flutter/hive_flutter.dart';

var cat1 = 0, cat2 = 0, cat3 = 0, cat4 = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final catlevel = Hive.box("Profile_data");
    if (catlevel.isNotEmpty) {
      cat1 = catlevel.get('Personal_FinancenumCorrect');
      cat2 = catlevel.get('Investment_and_Portfolio_ManagementnumCorrect');
      cat3 = catlevel.get('Behavioral_FinancenumCorrect');
      cat4 = catlevel.get('Capital_MarketnumCorrect');
    }
    tS = catlevel.get('totalScore');

    super.initState();
  }

  void toCategoryPage(x) {
    // ignore: prefer_typing_uninitialized_variables
    var numCat;
    if (x == 1) {
      //for finance category
      numCat = "0";
    } else if (x == 2) {
      //for investment category
      numCat = "1";
    } else if (x == 3) {
      //for behavioral category
      numCat = "2";
    } else if (x == 4) {
      // for capital category
      numCat = "3";
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(title: numCat)),
    );
  }

  //==========Category locking/unlocking
  categoryLock(String title, VoidCallback func) {
    if (title == 'Personal Finance') {
      return func;
    } else if (title == 'Investment and Portfolio Management' && cat1 >= 100) {
      return func;
    } else if (title == 'Behavioral Finance' && cat2 >= 100) {
      return func;
    } else if (title == 'Capital Markets' && cat3 >= 100) {
      return func;
    } else {
      return null;
    }
  }

  //==========Category color change
  categoryBGColor(String title, Color color, int grayColorNo) {
    List<Color> grayColor = [
      const Color.fromRGBO(150, 150, 150, 100),
      const Color.fromRGBO(90, 90, 90, 100),
      Colors.transparent
    ];
    if (title == 'Personal Finance') {
      return color;
    } else if (title == 'Investment and Portfolio Management' && cat1 >= 100) {
      return color;
    } else if (title == 'Behavioral Finance' && cat2 >= 100) {
      return color;
    } else if (title == 'Capital Markets' && cat3 >= 100) {
      return color;
    } else {
      return grayColor[grayColorNo];
    }
  }

  //==========Category card image/icon
  cardImage(String title, String image) {
    Image picture = Image(
        image: AssetImage(image), height: 130, width: 130, fit: BoxFit.cover);

    if (title == 'Personal Finance') {
      return picture;
    } else if (title == 'Investment and Portfolio Management' && cat1 >= 100) {
      return picture;
    } else if (title == 'Behavioral Finance' && cat2 >= 100) {
      return picture;
    } else if (title == 'Capital Markets' && cat3 >= 100) {
      return picture;
    } else {
      return const Icon(Icons.lock_rounded, size: 60, color: Colors.black87);
    }
  }

  Widget category(String title, String image, Color color1, Color color2,
      VoidCallback func, int catNo) {
    return Container(
      height: 210,
      width: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            categoryBGColor(title, color1, 0),
            categoryBGColor(title, color2, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: categoryBGColor(title, color2, 0),
            offset: const Offset(-2.5, 4.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: categoryLock(title, func),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AutoSizeText(title,
                    maxLines: 3,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins-Black',
                      fontWeight: FontWeight.w900,
                      height: 1,
                      letterSpacing: 1,
                    )),
              ),
              Align(
                alignment: const Alignment(0, 0.4),
                child: cardImage(title, image),
              ),
              Align(
                alignment: const Alignment(0, 1.08),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.star_rounded,
                        size: 25,
                        color: categoryBGColor(title, Colors.yellow, 2)),
                    Text(catNo.toString(),
                        style: TextStyle(
                          color: categoryBGColor(title, Colors.black, 2),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        )),
                  ],
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
        appBar: AppBar(
          title: const Text(
            "TOPICS",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: 'Poppins-ExtraBold',
              fontWeight: FontWeight.w800,
            ),
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 15, 8),
              padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(81, 231, 168, 0.4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(81, 231, 168, 1),
                  width: 3,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 30,
                    color: Colors.yellow,
                  ),
                  Text(nullToZero(tS).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'Welcome!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w900,
                        height: 0,
                        letterSpacing: 1,
                      )),
                  TextSpan(
                      text: '\nFind a course you want to learn',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 2,
                        letterSpacing: 0.5,
                      )),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                category(
                  'Personal Finance',
                  'assets/images/personal_finance.png',
                  const Color.fromRGBO(186, 229, 61, 1),
                  const Color.fromRGBO(83, 215, 80, 1),
                  () => {toCategoryPage(1)},
                  cat1,
                ),
                category(
                  'Investment and Portfolio Management',
                  'assets/images/investment_and_portfolio_management.png',
                  const Color.fromRGBO(213, 162, 244, 1),
                  const Color.fromRGBO(81, 90, 218, 1),
                  () => {
                    if (cat1 >= 100)
                      {toCategoryPage(2)}
                    else if (cat1 < 100)
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Need to finish Personal Finance first'),
                          backgroundColor: Color.fromARGB(255, 170, 7, 7),
                        )),
                      }
                  },
                  cat2,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                category(
                  'Behavioral Finance',
                  'assets/images/behavioral_finance.png',
                  const Color.fromRGBO(255, 143, 163, 0.86),
                  const Color.fromRGBO(215, 32, 32, 1),
                  () => {
                    if (cat2 >= 100)
                      {toCategoryPage(3)}
                    else if (cat2 < 100)
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Need to finish Investment and Portfolio Management first'),
                          backgroundColor: Color.fromARGB(255, 170, 7, 7),
                        )),
                      }
                  },
                  cat3,
                ),
                category(
                  'Capital Markets',
                  'assets/images/capital_markets.png',
                  const Color.fromRGBO(240, 243, 60, 1),
                  const Color.fromRGBO(241, 106, 47, 1),
                  () => {
                    if (cat3 >= 100)
                      {toCategoryPage(4)}
                    else if (cat3 < 100)
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('Need to finish Behavioral Finance first'),
                          backgroundColor: Color.fromARGB(255, 170, 7, 7),
                        )),
                      }
                  },
                  cat4,
                ),
              ],
            ),
          ],
        ),
      );
}
