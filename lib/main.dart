import 'package:flutter/material.dart';
import 'core/theme/app_fonts.dart';
import 'features/smart_post/presentation/screens/smart_post_screen.dart';

void main() => runApp(const SmartPostApp());

class SmartPostApp extends StatelessWidget {
  const SmartPostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Post',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: AppFonts.body, useMaterial3: true),
      home: const SmartPostScreen(),
    );
  }
}
