import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
            SizedBox(
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
              Text(
                'GENERAL',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.volume_up_outlined,
                    color: Colors.black,
                  ),
                  title: Text('Sounds'),
                  trailing: Icon(
                    Icons.toggle_on_outlined,
                    color: Color.fromRGBO(5, 195, 107, 50),
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: 12.0),

              //ACCOUNT
              Text(
                'ACCOUNT',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  title: Text('Avatar'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  title: Text('Name'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.alternate_email_outlined,
                    color: Colors.black,
                  ),
                  title: Text('Email'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.pin_outlined,
                    color: Colors.black,
                  ),
                  title: Text('Password'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.link_outlined,
                    color: Colors.black,
                  ),
                  title: Text('Linked Account'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 12.0),

              // FEEDBACK
              Text(
                'FEEDBACK',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.grade_rounded, color: Colors.yellow),
                  title: Text('Rate our App'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.bug_report_rounded, color: Colors.red),
                  title: Text('Report a problem'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 12.0),

              //LEGAL
              Text(
                'LEGAL',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Poppins-Medium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.policy_outlined, color: Colors.black),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.groups_outlined, color: Colors.black),
                  title: Text('About Us'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                      color: Color.fromRGBO(5, 195, 107, 50), width: 0),
                ),
                elevation: 2,
                child: ListTile(
                  leading:
                      Icon(Icons.text_snippet_outlined, color: Colors.black),
                  title: Text('Terms of Use'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
}
