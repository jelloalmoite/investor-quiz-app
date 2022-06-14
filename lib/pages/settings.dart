import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:launch_review/launch_review.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController controller;
  String name = ' ';

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  //==========Start of Rating
  final _dialog = RatingDialog(
    initialRating: 1.0,
    // your app's name?
    title: const Text(
      'Investor Quiz App',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),

    message: const Text(
      'Tap a star to set your rating.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
    image: Image.asset(
      "assets/images/logo.png",
      width: 50,
    ),
    submitButtonText: 'Submit',
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');

      //
      if (response.rating < 3.0) {
        print('response.rating: ${response.rating}');
      } else {
        LaunchReview.launch(
          androidAppId: "com.kiloo.subwaysurf",
        );
      }
    },
  );
  //==========End of Rating

  Widget settingText(word) {
    return Text(
      word,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontFamily: 'Poppins-Medium',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget settingCard(text, Icon icon, VoidCallback func) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side:
            const BorderSide(color: Color.fromRGBO(5, 195, 107, 50), width: 0),
      ),
      elevation: 2,
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontFamily: 'Poppins-Medium',
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        onTap: func,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "SETTINGS",
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
            const SizedBox(
              width: 15,
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              settingText("General"),
              const SizedBox(height: 4.0),
              settingCard(
                "Share the App",
                const Icon(Icons.share_outlined, color: Colors.black),
                () async {
                  final urlPreview =
                      'https://play.google.com/store/apps/details?id=no.mobitroll.kahoot.android&hl=en&gl=US';
                  await Share.share('Available Now\n\n$urlPreview');
                },
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(
                      color: const Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(
                    Icons.volume_up_outlined,
                    color: Colors.black,
                  ),
                  title: const Text(
                    'Sounds',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.toggle_on_outlined,
                    color: Color.fromRGBO(5, 195, 107, 50),
                    size: 35,
                  ),
                  onTap: () => {},
                ),
              ),
              const SizedBox(height: 12.0),
              //ACCOUNT
              settingText("Account"),
              const SizedBox(height: 4.0),
              settingCard(
                  "Avatar",
                  const Icon(Icons.account_circle_outlined,
                      color: Colors.black),
                  () => {}),
              settingCard(
                "Name",
                const Icon(Icons.account_circle, color: Colors.black),
                () async {
                  final name = await openDialog();
                  if (name == null || name.isEmpty) return;
                  setState(() => this.name = name);
                },
              ),
              settingCard(
                  "Email",
                  const Icon(Icons.alternate_email_outlined,
                      color: Colors.black),
                  () => {}),
              settingCard(
                  "Password",
                  const Icon(Icons.pin_outlined, color: Colors.black),
                  () => {}),
              settingCard(
                  "Linked Account",
                  const Icon(Icons.link_outlined, color: Colors.black),
                  () => {}),

              const SizedBox(height: 12.0),

              // FEEDBACK
              settingText("Feedback"),
              const SizedBox(height: 4.0),
              settingCard("Rate our App",
                  const Icon(Icons.grade_rounded, color: Colors.yellow), () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => _dialog,
                );
              }),
              settingCard(
                  "Report a problem",
                  const Icon(Icons.bug_report_rounded, color: Colors.red),
                  () => {}),

              const SizedBox(height: 12.0),
              //LEGAL
              settingText("Legal"),
              const SizedBox(height: 4.0),

              settingCard(
                  "Privacy Policy",
                  const Icon(Icons.policy_outlined, color: Colors.black),
                  () => {}),
              settingCard(
                  "About Us",
                  const Icon(Icons.groups_outlined, color: Colors.black),
                  () => {}),
              settingCard(
                  "Terms of Use",
                  const Icon(Icons.text_snippet_outlined, color: Colors.black),
                  () => {}),
            ],
          ),
        ),
      );

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your Name'),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: 'Enter Your Name'),
            controller: controller,
            onSubmitted: (_) => submit(),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: submit,
            )
          ],
        ),
      );

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }
}
