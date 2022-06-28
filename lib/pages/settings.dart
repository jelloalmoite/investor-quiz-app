import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:launch_review/launch_review.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:investor_quizapp/pages/documents.dart';

var documents = Documents();

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController controller;
  String name = ' ';
  String bugReport = ' ';
  File? image;

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
    initialRating: 5.0,
    // your app's name?
    title: const Text(
      'Investor Quiz App',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 25.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),

    message: const Text(
      'Tap a star to set your rating.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    ),
    image: Image.asset(
      "assets/images/logo.png",
      width: 50,
    ),
    submitButtonText: 'Submit',
    commentHint: 'Add comment',
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
                  () => {openAvatarDialog(context)}),
              settingCard(
                "Name",
                const Icon(Icons.account_circle, color: Colors.black),
                () async {
                  final name = await openNameDialog(context);
                  if (name == null || name.isEmpty) {
                    controller.clear();
                  }
                },
              ),

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
                () async {
                  final report = await openReportDialog(context);
                  if (report == null || report.isEmpty) return;
                  setState(() => this.bugReport = report);
                },
              ),

              const SizedBox(height: 12.0),
              //LEGAL
              settingText("Legal"),
              const SizedBox(height: 4.0),

              settingCard("Privacy Policy",
                  const Icon(Icons.policy_outlined, color: Colors.black), () {
                // getPdfText(
                //     "Privacy Policy", 'inqui_privacy_policy.pdf', context);
                _showAlert(context, "Privacy Policy", documents.privacyPolicy);
              }),
              settingCard("About Us",
                  const Icon(Icons.groups_outlined, color: Colors.black), () {
                _showAlert(context, "About Us", documents.aboutUs);
              }),
              settingCard("Terms of Use",
                  const Icon(Icons.text_snippet_outlined, color: Colors.black),
                  () {
                _showAlert(context, "Terms & Conditions", documents.termsOfUse);
              }),
            ],
          ),
        ),
      );

  Future<String?> openNameDialog(BuildContext context) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Your Name',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Enter Your Name'),
            controller: controller,
            onSubmitted: (_) => submitText(context),
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              onPressed: () {
                submitText(context);
              },
            ),
          ],
        ),
      );

  Future<String?> openReportDialog(BuildContext context) => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'What Happened?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: TextField(
            maxLines: 18,
            autofocus: true,
            decoration: const InputDecoration(
              hintText:
                  'Briefly explain what happened and what we need to do to reproduce the problem.',
              border: OutlineInputBorder(),
            ),
            controller: controller,
            onSubmitted: (_) => submitText(context),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(10),
              alignment: FractionalOffset.topRight,
              child: GestureDetector(
                child: TextButton.icon(
                  label: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  icon: const Icon(Icons.send_outlined),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(5, 195, 107, 50),
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    submitText(context);
                  },
                ),
              ),
            ),
          ],
        ),
      );

  void submitText(BuildContext context) {
    Navigator.of(context).pop(controller.text);
    setState(() => name = name);
  }

  //For PDF/Docs Reader(Getting text content of file)
  /*
  Future<String> _readFilesFromAssets(String fileName) async {
    String text = await rootBundle.loadString('documents/$fileName');
    return text;
  }

  getDocxText(String title, String fileName, BuildContext context) async {
    String text = await _readFilesFromAssets(fileName);
    _showAlert(context, title, text);
  }

  //==========PDF Text Reader
  Future<List<int>> _readDocumentData(String name) async {
    final ByteData data = await rootBundle.load('assets/documents/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  getPdfText(String title, String pdfName, BuildContext context) async {
    String text = "";

    PdfDocument document =
        PdfDocument(inputBytes: await _readDocumentData(pdfName));

    // final List<TextLine> textLine =
    //     PdfTextExtractor(document).extractTextLines();

    // for (int i = 0; i < textLine.length; i++) {
    //   text = text + "\n" + textLine[i].text;
    // }

    text = PdfTextExtractor(document).extractText();

    _showAlert(context, title, text);
  }
  //==========End of PDF Text Reader
  */

  void _showAlert(BuildContext context, String title, RichText text) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => AlertDialog(
              actions: [
                Container(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    child: TextButton(
                      child: const Text(
                        'Close',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color.fromRGBO(5, 195, 107, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color.fromRGBO(5, 195, 107, 50),
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                    fontSize: 22.0,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.w700),
              ),
              content: text,
              scrollable: true,
            ));
  }

  buildButton(String title, IconData icon, VoidCallback func) {
    return SizedBox(
      width: 180,
      child: ElevatedButton.icon(
        onPressed: func,
        icon: Icon(icon, color: Colors.black, size: 25),
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(81, 231, 168, 1)),
        ),
      ),
    );
  }

  Future pickImage(ImageSource source, BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
    Navigator.pop(context);
    openAvatarDialog(context);
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future openAvatarDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: const Text(
            'Select Profile Picture',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          content: SizedBox(
            height: 240,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: image != null
                        ? ClipOval(child: Image.file(image!, fit: BoxFit.cover))
                        : const Image(
                            image: AssetImage('assets/images/logo.png')),
                  ),
                  const SizedBox(height: 20),
                  buildButton('Gallery', Icons.photo_library_rounded,
                      () => {pickImage(ImageSource.gallery, context)}),
                  const SizedBox(height: 10),
                  buildButton('Camera', Icons.photo_camera_rounded,
                      () => {pickImage(ImageSource.camera, context)}),
                ]),
          ),
          actions: [
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              onPressed: () => {},
            )
          ],
        ),
      );
}
