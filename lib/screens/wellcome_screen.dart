import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thirdnoteapptry/providers/google_provider.dart';
import 'package:thirdnoteapptry/screens/authscreen/login_screen.dart';
import 'package:thirdnoteapptry/screens/authscreen/signup.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Container MyArticles(String imageVal) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 150),
      height: 300,
      width: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(
          imageVal,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/1deneme.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            height: 700,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 60,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/stickernote.png",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/todo2.png",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/tracker.png",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 400,
            right: 190,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.swipe_rounded),
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 130,
            right: 110,
            child: Container(
              height: 80,
              width: 160,
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/images/user.png',
                      color: Colors.white,
                      height: 30,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginAuth()));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginAuth()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            right: 130,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signup()));
                  },
                  child: const Text(
                    'Create an account.',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              right: 105,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      color: const Color(0xFF397AF3),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  // //Sign In with google
                                  AuthClass()
                                      .signWithGoogle()
                                      .then((UserCredential value) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen()),
                                        (route) => false);
                                  });
                                },
                                icon: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/googleicon.jpeg',
                                    height: 40,
                                  ),
                                )),
                            const Text(
                              'Sign in with Google   ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
