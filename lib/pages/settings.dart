import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
              settingCard("Avatar", const Icon(Icons.account_circle_outlined,
                      color: Colors.black),
                  () => {}),
              settingCard(
                  "Name",
                  const Icon(Icons.account_circle, color: Colors.black),
                  () => {}),
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
              settingCard(
                  "Rate our App",
                  const Icon(Icons.grade_rounded, color: Colors.yellow),
                  () => {}),
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
}
