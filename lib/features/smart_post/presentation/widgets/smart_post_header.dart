import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_text.dart';

class SmartPostHeader extends StatelessWidget {
  final bool showAssistant;
  const SmartPostHeader({super.key, this.showAssistant = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 65,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: showAssistant
                      ? const _AssistantButton()
                      : const SizedBox(),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      AppAssets.oriflameLogo,
                      height: 40,
                      errorBuilder: (_, __, ___) => const Text(
                        'ORIFLAME',
                        style: TextStyle(
                          fontFamily: AppFonts.body,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 70, child: _CameraButton()),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 45,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Smart Post', style: AppText.tabActive),
                Text('Library', style: AppText.tabInactive),
                Text('Communities', style: AppText.tabInactive),
                Text('Share&Win', style: AppText.tabInactive),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AssistantButton extends StatelessWidget {
  const _AssistantButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.chipDark,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                AppAssets.aiAssistant,
                width: 18,
                height: 18,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            // Positioned(
            //   right: -6,
            //   top: -6,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            //     decoration: BoxDecoration(
            //       color: AppColors.oriflameGreen.withOpacity(0.85),
            //       borderRadius: BorderRadius.circular(4),
            //     ),
            //     child: const Text(
            //       'AI',
            //       style: TextStyle(
            //         fontFamily: AppFonts.body,
            //         fontStyle: FontStyle.italic,
            //         fontWeight: FontWeight.w700,
            //         fontSize: 10,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 4),
        const Text('Your Assistant', style: AppText.captionSmallGray),
      ],
    );
  }
}

class _CameraButton extends StatelessWidget {
  const _CameraButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            color: AppColors.chipDark,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 18,
          ),
        ),
        const SizedBox(height: 4),
        const Text('Camera', style: AppText.captionSmallGray),
      ],
    );
  }
}
