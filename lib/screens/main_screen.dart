import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thirdnoteapptry/providers/google_provider.dart';
import 'package:thirdnoteapptry/screens/wellcome_screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        //SignOut
                        AuthClass().signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()),
                            (route) => false);
                      },
                      icon: const Icon(Icons.more_horiz_rounded)),
                ],
              ),
              const SizedBox(height: 37),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/avatar.gif'),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Welcome,\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'Turgay',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          )
                        ]),
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: _scrollNotification,
                    child: ListView(
                      controller: listScrollController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        AnimatedContainer(
                          height: 50,
                          width: 150,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          duration: const Duration(milliseconds: 100),
                          transform: Matrix4.rotationZ(
                              scrollDirection == ScrollDirection.forward
                                  ? 0.07
                                  : scrollDirection == ScrollDirection.reverse
                                      ? -0.07
                                      : 0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: const Offset(-6, 4),
                                  blurRadius: 10)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.note_alt_rounded,
                                    size: 30,
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Notes',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          height: 50,
                          width: 150,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          duration: const Duration(milliseconds: 100),
                          transform: Matrix4.rotationZ(
                              scrollDirection == ScrollDirection.forward
                                  ? 0.07
                                  : scrollDirection == ScrollDirection.reverse
                                      ? -0.07
                                      : 0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: const Offset(-6, 4),
                                  blurRadius: 10)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.list_alt,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'ToDo\nList',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          height: 50,
                          width: 150,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          duration: const Duration(milliseconds: 100),
                          transform: Matrix4.rotationZ(
                              scrollDirection == ScrollDirection.forward
                                  ? 0.07
                                  : scrollDirection == ScrollDirection.reverse
                                      ? -0.07
                                      : 0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  offset: const Offset(-6, 4),
                                  blurRadius: 10)
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  const Icon(
                                    Icons.done,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Work\nDone',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Notes Preview',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 1.491,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    for (var wonder in wonders)
                      Image.asset('assets/images/$wonder.png')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final wonders = ['stickernote', 'stickernote', 'stickernote', 'stickernote'];
