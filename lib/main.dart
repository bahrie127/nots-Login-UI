import 'package:flutter/material.dart';
import 'package:thirdnoteapptry/screens/hello.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Animation",
      themeMode: ThemeMode.system,
      home: WelcomeScreen(),
    );
  }
}
