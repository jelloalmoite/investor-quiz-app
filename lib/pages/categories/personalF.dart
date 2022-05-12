import 'package:flutter/material.dart';
import 'package:investor_quizapp/pages/quiz.dart';

class PersonalFinance extends StatelessWidget {
  const PersonalFinance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromRGBO(88, 212, 84, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // 0 yung value para mawala yung back shadow sa app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          iconSize: 35,
          color: Colors.black,
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.start_rounded),
            iconSize: 35,
            color: Colors.black,
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Quiz1()),
              )
            },
          ),
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Text('Personal\nFinance',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Poppins-Black',
                      fontWeight: FontWeight.w900,
                    )),
                //const Padding(padding: EdgeInsets.all(5.0)),    //Space between columns
                Material(
                  color: Colors.transparent,
                  //elevation: 8,
                  borderRadius: BorderRadius.circular(15),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: const Image(
                    image: AssetImage('assets/images/personal_finance.png'),
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(6.0)), //Space between rows
            Container(
              color: Colors.white,
              constraints: const BoxConstraints.tightForFinite(
                width: 600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const <Widget>[
                  Text('Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Poppins-ExtraBold',
                        fontWeight: FontWeight.w800,
                      )),
                ],
              ),
            ),
          ]));
}

// Personal Finance Color
// Green (#58d454)   'Color.fromRGBO(88, 212, 84, 1)'