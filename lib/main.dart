import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const KostayApp());
}

class KostayApp extends StatelessWidget {
  const KostayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KOSTAY',
      theme: ThemeData(
        fontFamily: 'DM Sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7654D6),
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}