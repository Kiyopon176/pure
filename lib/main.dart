import 'package:flutter/material.dart';
import 'package:pure/pages/chat_page.dart';
import 'package:pure/pages/show_chat_page.dart';
import 'package:pure/themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowChatPage(),
      theme: darkMode,
    );
  }
}