import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';

class CaptionSuggestionBox extends StatefulWidget {
  final VoidCallback onEditCaption;
  const CaptionSuggestionBox({super.key, required this.onEditCaption});

  @override
  State<CaptionSuggestionBox> createState() => _CaptionSuggestionBoxState();
}

class _CaptionSuggestionBoxState extends State<CaptionSuggestionBox> {
  bool _isExpanded = false;

  static const _fullCaption = '💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! '
      'This luxurious creamy formula glides on smoothly to keep your lips soft, plump, and perfectly hydrated all day. '
      'Infused with moisture-locking ingredients to nourish, smooth, and add a natural, glossy finish. '
      'Say goodbye to dryness and hello to a luscious, healthy pout! 💋✨ #HydratedLips #PlumpAndGlow #LipCare';

  static const _shortCaption = '💄Elevate your beauty with the Giordani Gold - Eternal Glow Lipstick SPF 25! This luxurious creamy... ';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: AppColors.overlayDark(0.39), borderRadius: BorderRadius.circular(12)),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.auto_fix_high, color: Colors.white, size: 16),
                const SizedBox(width: 6),
                const Text('CAPTION SUGGESTION', style: AppText.songLabel),
                const Spacer(),
                if (_isExpanded)
                  GestureDetector(
                    onTap: widget.onEditCaption,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.edit_outlined, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text('Edit Caption', style: AppText.productPrice),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() => _isExpanded = !_isExpanded);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _isExpanded ? _fullCaption : _shortCaption,
                      style: AppText.captionBody,
                    ),
                    if (!_isExpanded)
                      const TextSpan(text: 'see more', style: AppText.captionSeeMore),
                  ],
                ),
              ),
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: 'UK-AMANDA3012'));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Referral code copied!'), duration: Duration(seconds: 2)));
                      },
                      child: const Text('Use my referral code: UK-AMANDA3012', style: AppText.referralText),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(const ClipboardData(text: 'www.oriflame.com/giordani/amada3012'));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Referral link copied!'), duration: Duration(seconds: 2)));
                      },
                      child: const Text('Use my referral link: www.oriflame.com/giordani/amada3012', style: AppText.referralText),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
