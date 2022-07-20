import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '/pages/categoryStats.dart';

var cat1 = 0, cat2 = 0, cat3 = 0;

final categoryboxa = Hive.box("Profile_data");
final profilebox = Hive.box('User_info');
final avatarbox = Hive.box('avatar');
var pFq,
    pFc,
    pFw,
    pFss,
    iPMq,
    iPMc,
    iPMw,
    iPMs,
    bFq,
    bFc,
    bFw,
    bFs,
    cMq,
    cMc,
    cMw,
    cMs,
    cH,
    cL,
    tHm,
    tHs,
    tLm,
    tLs,
    tS,
    tA,
    name,
    email,
    avatar;

nullToZero(int? num) {
  if (num == null) {
    num = 0;
  }
  return num;
}

toTimeFormat(String min, String sec) {
  String time;
  time = min.padLeft(2, '0') + ":" + sec.padLeft(2, '0');
  return time;
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  @override
  void initState() {
    pFq = categoryboxa.get('Personal_FinancenumQuestion');
    pFc = categoryboxa.get('Personal_FinancenumCorrect'); //cat1
    pFw = categoryboxa.get('Personal_FinancenumWrong');
    pFss = categoryboxa.get('Personal_FinancenumSkip');
    iPMq = categoryboxa.get('Investment_and_Portfolio_ManagementnumQuestion');
    iPMc = categoryboxa
        .get('Investment_and_Portfolio_ManagementnumCorrect'); //cat2
    iPMw = categoryboxa.get('Investment_and_Portfolio_ManagementnumWrong');
    iPMs = categoryboxa.get('Investment_and_Portfolio_ManagementnumSkip');
    bFq = categoryboxa.get('Behavioral_FinancenumQuestion');
    bFc = categoryboxa.get('Behavioral_FinancenumCorrect'); //cat3
    bFw = categoryboxa.get('Behavioral_FinancenumWrong');
    bFs = categoryboxa.get('Behavioral_FinancenumSkip');
    cMq = categoryboxa.get('Capital_MarketnumQuestion');
    cMc = categoryboxa.get('Capital_MarketnumCorrect');
    cMw = categoryboxa.get('Capital_MarketnumWrong');
    cMs = categoryboxa.get('Capital_MarketnumSkip');
    cH = categoryboxa.get('correctHighest');
    cL = categoryboxa.get('correctLowest');
    tHm = categoryboxa.get('timeHighestM');
    tHs = categoryboxa.get('timeHighestS');
    tLm = categoryboxa.get('timeLowestM');
    tLs = categoryboxa.get('timeLowestS');
    tS = categoryboxa.get('totalScore');
    tA = categoryboxa.get('totalAttempt');

    if (categoryboxa.isNotEmpty) {
      cat1 = pFc;
      cat2 = iPMc;
      cat3 = bFc;
    }

    setState(() {
      //////////FOR NAME AND EMAIL////////// START
      if (profilebox.isEmpty) {
        profilebox.put('username', "Anonymous User");
        profilebox.put('useremail', "No email");
      }
      name = profilebox.get('username');
      email = profilebox.get('useremail');
      //////////FOR NAME AND EMAIL////////// END

      //////////avatar////////// START
      // if (avatarbox.isEmpty) {
      //   avatarbox.put(
      //       'avatar', 'assets/images/logo.png'); //default avatar profile
      // }
      avatar = avatarbox.get('avatar');
      /////////////avatar////////// END
    });

    if (avatar != null) {
      image = File(avatar);
    }

    super.initState();
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

  //==========Category card image/icon
  cardImage(String title, String image) {
    Image picture = Image(
        image: AssetImage(image), height: 80, width: 80, fit: BoxFit.cover);

    if (title == 'Personal Finance') {
      return picture;
    } else if (title == 'Investment and Portfolio Management' && cat1 >= 100) {
      return picture;
    } else if (title == 'Behavioral Finance' && cat2 >= 100) {
      return picture;
    } else if (title == 'Capital Markets' && cat3 >= 100) {
      return picture;
    } else {
      return const Icon(Icons.lock_rounded, size: 50, color: Colors.black87);
    }
  }

  //==========Category color change
  categoryBGColor(String title, Color color) {
    if (title == 'Personal Finance') {
      return color;
    } else if (title == 'Investment and Portfolio Management' && cat1 >= 100) {
      return color;
    } else if (title == 'Behavioral Finance' && cat2 >= 100) {
      return color;
    } else if (title == 'Capital Markets' && cat3 >= 100) {
      return color;
    } else {
      return const Color.fromRGBO(150, 150, 150, 100);
    }
  }

  Widget category(String image, String title, Color color, VoidCallback func,
      double widthSize) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: categoryLock(title, func),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          height: 90,
          width: 310,
          decoration: BoxDecoration(
            color: categoryBGColor(title, color),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: cardImage(title, image),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: widthSize * 0.45,
                child: AutoSizeText(
                  title,
                  maxLines: 3,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins-SemiBold',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.0,
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
  Widget build(BuildContext context) {
    void toCategoryStats(String title, var correct, var wrong, var skip) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CategoryStats(title: title, nC: correct, nW: wrong, nS: skip)),
      );
    }

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(81, 231, 168, 1),
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
          const SizedBox(width: 15),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: size.height * 0.12,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        height: 80,
                        width: 80,
                        child: image != null
                            ? ClipOval(
                                child: Image.file(image!, fit: BoxFit.cover))
                            : const Icon(
                                Icons.account_circle_outlined,
                                size: 100,
                                color: Colors.black,
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        width: size.width * 0.6,
                        child: AutoSizeText(
                          name.toString(), //name
                          maxLines: 3,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                      ),
                    ]),
              ),

              //White Box
              Container(
                height: size.height * 0.58, //410
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                child: Column(
                  children: [
                    //Score & Attempts Box
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(81, 231, 168, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //=====Score
                            SizedBox(
                              height: 75,
                              width: 75,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star_border_outlined,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    const Text(
                                      'SCORE',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      nullToZero(tS).toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 1.1),
                                    ),
                                  ]),
                            ),
                            //=====Divider
                            Container(
                              height: 60,
                              width: 4,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            //=====Attempts
                            SizedBox(
                              height: 75,
                              width: 75,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.restart_alt_outlined,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                    const Text(
                                      'ATTEMPTS',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      nullToZero(tA).toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontFamily: 'Poppins-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 1.1),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: size.height * 0.38,
                      child: ListView(children: <Widget>[
                        //Accuracy
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Text("Accuracy:",
                                  style: TextStyle(
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
                                radius: 55.0,
                                lineWidth: 9.0,
                                animation: true,
                                percent:
                                    ((nullToZero(cH) + nullToZero(cL)) / 20),
                                center: Text(
                                  (((nullToZero(cH) + nullToZero(cL)) / 20) *
                                              100)
                                          .toString() +
                                      "%",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor:
                                    const Color.fromRGBO(5, 195, 107, 100),
                                backgroundColor:
                                    const Color.fromRGBO(83, 215, 80, 0.3),
                              ),
                              const SizedBox(width: 8.0),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Highest: " +
                                        nullToZero(cH).toString() +
                                        "/10",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: "\nLowest: " +
                                        nullToZero(cL).toString() +
                                        "/10",
                                    style: const TextStyle(
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
                            children: const <Widget>[
                              Text("Average Time:",
                                  style: TextStyle(
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
                                radius: 55.0,
                                lineWidth: 9.0,
                                animation: true,
                                percent: (((((nullToZero(tHm) * 60) +
                                            nullToZero(tHs)) +
                                        ((nullToZero(tLm) * 60) +
                                            nullToZero(tLs)))) /
                                    600),
                                center: Text(
                                  ((((nullToZero(tHm) * 60) + nullToZero(tHs)) +
                                                  ((nullToZero(tLm) * 60) +
                                                      nullToZero(tLs))) /
                                              6)
                                          .toStringAsFixed(2) +
                                      "%",
                                  style: const TextStyle(
                                      fontFamily: 'Poppins-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor:
                                    const Color.fromRGBO(5, 195, 107, 100),
                                backgroundColor:
                                    const Color.fromRGBO(83, 215, 80, 0.3),
                              ),
                              const SizedBox(width: 8.0),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Max: " +
                                        toTimeFormat(nullToZero(tHm).toString(),
                                            nullToZero(tHs).toString()),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextSpan(
                                    text: "\nMin: " +
                                        toTimeFormat(nullToZero(tLm).toString(),
                                            nullToZero(tLs).toString()),
                                    style: const TextStyle(
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
                            () => {
                                  toCategoryStats(
                                      "Personal Finance",
                                      nullToZero(pFc),
                                      nullToZero(pFw),
                                      nullToZero(pFss))
                                },
                            size.width),
                        const SizedBox(height: 10),
                        category(
                            "assets/images/investment_and_portfolio_management.png",
                            "Investment and Portfolio Management",
                            const Color.fromRGBO(103, 81, 239, 81),
                            () => {
                                  if (nullToZero(pFc) >= 100)
                                    {
                                      toCategoryStats(
                                          "Investment and Portfolio Management",
                                          iPMc,
                                          iPMw,
                                          iPMs),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text('This category is locked'),
                                        backgroundColor:
                                            Color.fromARGB(255, 170, 7, 7),
                                      ))
                                    }
                                },
                            size.width),
                        const SizedBox(height: 10),
                        category(
                            "assets/images/behavioral_finance.png",
                            "Behavioral Finance",
                            const Color.fromRGBO(255, 78, 109, 90),
                            () => {
                                  if (nullToZero(iPMc) >= 100)
                                    {
                                      toCategoryStats(
                                          "Behavioral Finance", bFc, bFw, bFs),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text('This category is locked'),
                                        backgroundColor:
                                            Color.fromARGB(255, 170, 7, 7),
                                      ))
                                    }
                                },
                            size.width),
                        const SizedBox(height: 10),
                        category(
                            "assets/images/capital_markets.png",
                            "Capital Markets",
                            const Color.fromRGBO(255, 147, 81, 1),
                            () => {
                                  if (nullToZero(bFc) >= 100)
                                    {
                                      toCategoryStats(
                                          "Capital Markets", cMc, cMw, cMs),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text('This category is locked'),
                                        backgroundColor:
                                            Color.fromARGB(255, 170, 7, 7),
                                      ))
                                    }
                                },
                            size.width),
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
}
