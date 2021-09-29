import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thirdnoteapptry/widgets/login_form.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Container MyArticles(String imageVal) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 90),
      height: 400,
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.white,
        elevation: 20,
        margin: const EdgeInsets.all(9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageVal,
            fit: BoxFit.fill,
          ),
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
                Column(
                  children: [
                    MyArticles(
                      "https://images.unsplash.com/photo-1586202690180-1967f682ef1a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=744&q=80",
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyArticles(
                      "https://images.unsplash.com/photo-1616628188540-925618b98318?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=687&q=80",
                    ),
                  ],
                ),
                Column(
                  children: [
                    MyArticles(
                      "https://images.unsplash.com/photo-1616628188725-0a474c982b5c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2187&q=80",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 140,
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
                      height: 40,
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  )
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
                  onPressed: () {},
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
                                onPressed: () {},
                                icon: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/images/googleicon.jpeg',
                                    height: 40,
                                  ),
                                )),
                            SizedBox(width: 1),
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
