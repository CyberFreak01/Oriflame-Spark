import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/constants/app_assets.dart';
import 'page_dots_indicator.dart';
import 'product_info_card.dart';
import 'song_recommendation_bar.dart';
import 'caption_suggestion_box.dart';
import 'quick_share_row.dart';

class PostPage extends StatefulWidget {
  final String bgAsset;
  final int index;
  final int total;
  final VoidCallback onEditCaption;

  const PostPage({
    super.key,
    required this.bgAsset,
    required this.index,
    required this.total,
    required this.onEditCaption,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          widget.bgAsset,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade300),
        ),
        // Bottom scrim so overlay text/cards stay legible over any photo.
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  const Color(0xFF2F2F2F).withOpacity(0.6),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: _TopOverlay(index: widget.index, total: widget.total),
        ),
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: Center(
            child: Transform.translate(
              offset: const Offset(0, -60),
              child: PageDotsIndicator(
                index: widget.index,
                total: widget.total,
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeTransition(
                opacity: _fade,
                child: SlideTransition(
                  position: _slide,
                  child: const ProductInfoCard(),
                ),
              ),
              const SizedBox(height: 4),
              const SongRecommendationBar(),
              const SizedBox(height: 4),
              CaptionSuggestionBox(onEditCaption: widget.onEditCaption),
              const SizedBox(height: 12),
              const QuickShareRow(),
              const SizedBox(height: 90), // clears the floating bottom nav
            ],
          ),
        ),
      ],
    );
  }
}

class _TopOverlay extends StatelessWidget {
  final int index;
  final int total;
  const _TopOverlay({required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: const AssetImage(AppAssets.avatar),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.pink.shade200.withOpacity(0.55),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.auto_awesome, size: 12, color: Colors.white),
                    SizedBox(width: 4),
                    Text('Ready to share', style: AppText.readyPill),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'High-converting in Oriflame Community',
                style: AppText.communityLine,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.overlayDark(0.39),
            borderRadius: BorderRadius.circular(38),
          ),
          child: Text('${index + 1} of $total', style: AppText.pageCounter),
        ),
      ],
    );
  }
}
