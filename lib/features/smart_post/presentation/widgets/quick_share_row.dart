import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/utils/social_share_util.dart';
import 'share_loading_dialog.dart';

class QuickShareRow extends StatelessWidget {
  const QuickShareRow({super.key});

  @override
  Widget build(BuildContext context) {
    const defaultCaption = '💧 Keep your lips soft, plump, and perfectly hydrated all day! Our Hyaluronic Lip Balm is infused with moisture-locking ingredients to nourish, smooth, and add a natural, glossy finish. Say goodbye to dryness and hello to a luscious, healthy pout! 💋✨ #HydratedLips #PlumpAndGlow #LipCare\nUse my referral link: https://www.oriflame.com/lipbalm/amanda10390\nUse my referral code: AMAOR3203';
    
    final icons = <Widget>[
      const SocialIconCircle(asset: AppAssets.instagram, fallback: Icons.camera_alt, platform: SharePlatform.instagram, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.instagramRing, fallback: Icons.camera_alt, ringColor: AppColors.storyRingPink),
      const SocialIconCircle(asset: AppAssets.facebook, fallback: Icons.facebook, platform: SharePlatform.facebook, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.facebookRing, fallback: Icons.facebook, ringColor: AppColors.storyRingBlue),
      const SocialIconCircle(asset: AppAssets.messenger, fallback: Icons.chat_bubble, platform: SharePlatform.messenger, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.tiktok, fallback: Icons.music_note, platform: SharePlatform.tiktok, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.whatsapp, fallback: Icons.chat, platform: SharePlatform.whatsapp, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.telegram, fallback: Icons.send, platform: SharePlatform.telegram, caption: defaultCaption),
      const SocialIconCircle(asset: AppAssets.xTwitter, fallback: Icons.close, platform: SharePlatform.twitter, caption: defaultCaption),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Quick share to:', style: AppText.quickShareLabel),
        const SizedBox(height: 8),
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: icons.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, i) => icons[i],
          ),
        ),
      ],
    );
  }
}

class SocialIconCircle extends StatelessWidget {
  final String asset;
  final IconData fallback;
  final Color? ringColor;
  final SharePlatform? platform;
  final String? caption;

  const SocialIconCircle({
    super.key,
    required this.asset,
    required this.fallback,
    this.ringColor,
    this.platform,
    this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: platform == null
          ? null
          : () => showShareLoadingDialog(
                context,
                captionToCopy: caption,
                onComplete: () => launchSocialShare(platform!, caption: caption ?? ''),
              ),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteFade(0.25),
          border: ringColor != null ? Border.all(color: ringColor!, width: 1.7) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(asset, errorBuilder: (_, __, ___) => Icon(fallback, color: Colors.white, size: 18)),
        ),
      ),
    );
  }
}
