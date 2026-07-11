import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../screens/edit_caption_screen.dart';
import '../widgets/smart_post_header.dart';
import '../widgets/post_page.dart';
import '../widgets/bottom_nav_bar.dart';

class SmartPostReelView extends StatefulWidget {
  const SmartPostReelView({super.key});

  @override
  State<SmartPostReelView> createState() => _SmartPostReelViewState();
}

class _SmartPostReelViewState extends State<SmartPostReelView> {
  final PageController _controller = PageController();
  int _index = 0;

  static const _backgrounds = [
    AppAssets.postBg1,
    AppAssets.postBg2,
    AppAssets.postBg3,
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SmartPostHeader(),
        Expanded(
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                scrollDirection: Axis.vertical,
                itemCount: _backgrounds.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) => PostPage(
                  bgAsset: _backgrounds[i],
                  index: i,
                  total: _backgrounds.length,
                  onEditCaption: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const EditCaptionScreen(),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: BottomNavBar(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
