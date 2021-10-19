import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:thirdnoteapptry/providers/signout_provider.dart';
import 'package:thirdnoteapptry/screens/NavigationIndex/settings_screen.dart';
import 'package:thirdnoteapptry/screens/wellcome_screen.dart';
import 'package:intl/intl.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  var listScrollController = ScrollController();
  var scrollDirection = ScrollDirection.idle;

  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes');

  List<Color> myColors = [
    const Color(0xFFFBE7C6),
    const Color(0xFFB4F8C8),
    const Color(0xFFA0E7E5),
    const Color(0xFFFFAEBC),
  ];

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
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgCover.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text('Settings'),
                        ),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text('Share'),
                        ),
                        PopupMenuItem<int>(
                          value: 2,
                          child: Row(
                            children: const [
                              Icon(Icons.logout),
                              SizedBox(width: 8),
                              Text('Sign Out'),
                            ],
                          ),
                        )
                      ],
                    )
                    // IconButton(
                    //     onPressed: () {
                    //       //SignOut
                    //       AuthClass().signOut();
                    //       Navigator.pushAndRemoveUntil(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => const WelcomeScreen()),
                    //           (route) => false);
                    //     },
                    //     icon: const Icon(Icons.more_horiz_rounded)),
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
                          // TextSpan(
                          //   text: 'Turgay',
                          //   style: TextStyle(fontWeight: FontWeight.normal),
                          // )
                        ],
                      ),
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
                              color: const Color(0xFFB4F8C8),
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
                              color: const Color(0xFFA0E7E5),
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
                              color: const Color(0xFFFFAEBC),
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
                // const SizedBox(height: 10),
                SizedBox(
                  height: 400,
                  child: FutureBuilder<QuerySnapshot>(
                    future: ref.get(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // ignore: prefer_is_empty
                        if (snapshot.data!.docs.length == 0) {
                          return const Center(
                            child: Text(
                              "You have no saved Notes !",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            Map data = snapshot.data!.docs[index].data();
                            DateTime mydateTime = data['created'].toDate();
                            String formattedTime =
                                DateFormat.yMMMd().add_jm().format(mydateTime);

                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(
                                  width: 1,
                                  color: Color(0xFFac0ed8),
                                ),
                              ),
                              color: Colors.grey[200],
                              clipBehavior: Clip.antiAlias,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.notes_rounded),
                                      title: Text(
                                        "${data['title']}",
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      subtitle: const Text('Tab to edit'),
                                    ),
                                    // Text(
                                    //   "${data['title']}",
                                    //   style: const TextStyle(
                                    //     fontSize: 24.0,
                                    //     fontWeight: FontWeight.bold,
                                    //     color: Colors.black87,
                                    //   ),
                                    // ),
                                    //
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        formattedTime,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text("Loading..."),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
          (route) => false);

      break;
    case 1:
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => SharePage()),
      // );
      break;
    case 2:
      AuthClass().signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          (route) => false);
  }
}
