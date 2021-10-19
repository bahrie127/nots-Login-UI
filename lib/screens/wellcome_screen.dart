import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thirdnoteapptry/providers/google_provider.dart';
import 'package:thirdnoteapptry/screens/authscreen/login_screen.dart';
import 'package:thirdnoteapptry/screens/authscreen/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore: non_constant_identifier_names
  Container MyArticles(String imageVal) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 100),
      height: 200,
      width: 200,
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
                image: AssetImage('assets/images/bgCover.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/kalem.gif",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/doc.gif",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    MyArticles(
                      "assets/images/clock.gif",
                    ),
                  ],
                ),
                const SizedBox(
                  width: 100,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 300,
            right: 120,
            child: Row(
              children: [
                Container(
                  child: Image.asset('assets/images/scroll.gif'),
                  height: 50,
                  alignment: FractionalOffset.center,
                  transform: Matrix4.identity()..rotateZ(90 * 3.1415927 / 180),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 130,
            right: 110,
            child: SizedBox(
              height: 80,
              width: 160,
              child: Row(
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/images/user.png',
                      color: Colors.black,
                      height: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginAuth()));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginAuth()));
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
                        color: Colors.black,
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
                    onTap: () {
                      signInWithGoogle(context);
                    },
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
                                signInWithGoogle(context);
                              },
                              icon: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/googleicon.jpeg',
                                  height: 40,
                                ),
                              ),
                            ),
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
