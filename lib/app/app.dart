import 'package:allakroapp/features/main_container/main_container_page.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 255, 255, 255),
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.white,
          background: Color(0xFFF2FFF0),
          onBackground: Color.fromARGB(255, 178, 244, 168),
          surface: Color(0xFFF2FFF0),
          onSurface: Color(0xFFF2FFF0),
        ),
      ),
      home: MainContainer(),
    );
  }
}
