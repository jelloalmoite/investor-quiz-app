import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/pages/historyCategory.dart';
import '/pages/home.dart';
import '/pages/profile.dart';
import '/pages/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Hive.initFlutter();
  await Hive.openBox('Personal_Finance');
  await Hive.openBox('Investment_and_Portfolio_Management');
  await Hive.openBox('Behavioral_Finance');
  await Hive.openBox('Capital_Market');
  await Hive.openBox('Profile_data');
  await Hive.openBox('User_info');
  await Hive.openBox('avatar');
  runApp(const MyApp());
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/logo_animated.gif',
          height: 280, width: 280),
      backgroundColor: Colors.white,
      nextScreen: const MainPage(chosenIndex: 0),
      splashIconSize: 280,
      duration: 3000, //1000 = 1 sec (default 2500)
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'inQui',
      theme: ThemeData(
        primarySwatch: myColor,
        scaffoldBackgroundColor: const Color.fromRGBO(254, 254, 254, 1),
      ),
      home: const SplashScreen(),
      //Kung debugging pwede paltan home ng MainPage()
    );
  }
}

const MaterialColor myColor = MaterialColor(0xFF51E7A8, <int, Color>{
  50: Color(0xFF51E7A8),
  100: Color(0xFF51E7A8),
  200: Color(0xFF51E7A8),
  300: Color(0xFF51E7A8),
  400: Color(0xFF51E7A8),
  500: Color(0xFF51E7A8),
  600: Color(0xFF51E7A8),
  700: Color(0xFF51E7A8),
  800: Color(0xFF51E7A8),
  900: Color(0xFF51E7A8),
});

class MainPage extends StatefulWidget {
  final int? chosenIndex;
  const MainPage({Key? key, required this.chosenIndex}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BannerAd _bannerAd;
  bool _isAdLoaded = false;

  _initBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              _isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {}),
    );

    _bannerAd.load();
  }

  int selectedIndex = 0;
  final screens = [
    const HomePage(),
    const HistoryPages(),
    const ProfilePage(),
    const SettingsPage(),
  ];
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    _initBannerAd();
    if (widget.chosenIndex != null) {
      selectedIndex = widget.chosenIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning =
            lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();
          final snackBar = SnackBar(
            content: const Text('Double Tap to Close App'),
            duration: maxDuration,
          );

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(snackBar);

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          title: _isAdLoaded
              ? SizedBox(
                  height: _bannerAd.size.height.toDouble(),
                  width: _bannerAd.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                )
              : const SizedBox(),
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: const Color.fromRGBO(81, 231, 168, 1),
            labelTextStyle: MaterialStateProperty.all(const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.bold)),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) =>
                setState(() => selectedIndex = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home_rounded),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.content_paste_rounded),
                  selectedIcon: Icon(Icons.content_paste_search_rounded),
                  label: 'History'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline_rounded),
                  selectedIcon: Icon(Icons.person_rounded),
                  label: 'Profile'),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings_rounded),
                  label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}

// App Color Scheme
//   Green     (#04c36b)  'Color.fromRGBO(4, 195, 107, 1)'
//   DarkGreen (#008037)  'Color.fromRGBO(0, 128, 55, 1)'
//   NeonGreen (#51e7a8)  'Color.fromRGBO(81, 231, 168, 1)'
//   LightGray (#E5E5E5)  'Color.fromRGBO(229, 229, 229, 1)'
//   White-ish (#FEFEFE)  'Color.fromRGBO(254, 254, 254, 1)'
//   OffWhite  (#F9F9F9)  'Color.fromRGBO(249, 249, 249, 1)'