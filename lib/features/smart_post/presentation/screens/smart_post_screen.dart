import 'package:flutter/material.dart';
import '../views/smart_post_loading_view.dart';
import '../views/smart_post_reel_view.dart';

class SmartPostScreen extends StatefulWidget {
  const SmartPostScreen({super.key});

  @override
  State<SmartPostScreen> createState() => _SmartPostScreenState();
}

class _SmartPostScreenState extends State<SmartPostScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: _isLoading
            ? SmartPostLoadingView(onFinished: () => setState(() => _isLoading = false))
            : const SmartPostReelView(),
      ),
    );
  }
}
