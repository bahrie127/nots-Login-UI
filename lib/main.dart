import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thirdnoteapptry/screens/home_screen.dart';
import 'package:thirdnoteapptry/screens/wellcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NotsApp',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            themeMode: ThemeMode.light,
            home: HomeScreen(),
          );
        });
  }
}
