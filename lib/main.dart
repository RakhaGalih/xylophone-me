import 'package:flutter/material.dart';
import 'package:xylophone/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('XYLOPHONE'),
        ),
        backgroundColor: const Color(0xFF151515),
        body: SafeArea(
            child: Container(
                child: (orientation == Orientation.portrait)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: kNotes)
                    : Row(
                        children: kNotes,
                      ))),
      ),
    );
  }
}
