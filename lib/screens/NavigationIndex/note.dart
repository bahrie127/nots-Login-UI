import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thirdnoteapptry/widgets/add_notes_screen.dart';
import 'package:thirdnoteapptry/widgets/view_notes_screen.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            ),
          )
              .then((value) {
            // ignore: avoid_print
            print("Calling Set  State !");
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFb19cd9),
      ),
      //
      appBar: AppBar(
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      //
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgCover.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                  Random random = Random();
                  Color bg = myColors[random.nextInt(4)];
                  Map data = snapshot.data!.docs[index].data();
                  DateTime mydateTime = data['created'].toDate();
                  String formattedTime =
                      DateFormat.yMMMd().add_jm().format(mydateTime);

                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => ViewNote(
                            data,
                            formattedTime,
                            snapshot.data!.docs[index].reference,
                          ),
                        ),
                      )
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: Card(
                      color: bg,
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
      ),
    );
  }
}
