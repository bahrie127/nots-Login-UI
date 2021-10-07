import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thirdnoteapptry/screens/homenav_screen.dart';
import 'package:thirdnoteapptry/screens/main_screen.dart';
import 'package:thirdnoteapptry/screens/wellcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage('assets/images/check.gif');
    var image = Image(
      image: assetsImage,
      fit: BoxFit.cover,
      height: 200,
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const HomeNavigationScreen()),
            (route) => false);
      }
    });
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgCover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [image],
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
