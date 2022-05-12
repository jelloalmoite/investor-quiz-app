import 'package:flutter/material.dart';
import 'package:investor_quizapp/pages/bookmarks.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
        backgroundColor: Colors.transparent,
        elevation: 0, // 0 yung value para mawala yung back shadow sa app bar
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline_rounded),
            iconSize: 35,
            color: Colors.black,
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Bookmarks()),
              )
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'History',
          style: TextStyle(fontSize: 60),
        ),
      ));
}
