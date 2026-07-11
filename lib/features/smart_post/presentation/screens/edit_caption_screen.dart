import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../../../../core/constants/app_assets.dart';

class EditCaptionScreen extends StatefulWidget {
  const EditCaptionScreen({super.key});

  @override
  State<EditCaptionScreen> createState() => _EditCaptionScreenState();
}

class _EditCaptionScreenState extends State<EditCaptionScreen> {
  static const _initialCaption =
      '💧 Keep your lips soft, plump, and perfectly hydrated all day! Our Hyaluronic '
      'Lip Balm is infused with moisture-locking ingredients to nourish, smooth, and '
      'add a natural, glossy finish. Say goodbye to dryness and hello to a luscious, '
      'healthy pout! 💋✨ #HydratedLips #PlumpAndGlow #LipCare\n'
      'Use my referral link: https://www.oriflame.com/lipbalm/amanda10390\n'
      'Use my referral code: AMAOR3203';

  late final TextEditingController _controller = TextEditingController(text: _initialCaption);
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final hasChanges = _controller.text != _initialCaption;
      if (_hasChanges != hasChanges) {
        setState(() => _hasChanges = hasChanges);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, color: AppColors.textDark, size: 24),
                  ),
                  const Expanded(child: Center(child: Text('Edit Caption', style: AppText.editCaptionTitle))),
                  GestureDetector(
                    onTap: _hasChanges ? () => Navigator.of(context).pop() : null,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: _hasChanges ? AppColors.oriflameGreen : AppColors.oriflameGreen.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Text(
                        'Save', 
                        style: AppText.saveButton.copyWith(
                          color: _hasChanges ? Colors.white : Colors.white.withOpacity(0.6)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  style: AppText.editCaptionBody,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Connect to AI Regeneration logic
        },
        backgroundColor: AppColors.chipDark,
        foregroundColor: Colors.white,
        elevation: 4,
        icon: Image.asset(
          AppAssets.aiAssistant,
          width: 25,
          height: 25,
          // color: Colors.white,
          errorBuilder: (_, __, ___) => const Icon(Icons.auto_awesome, color: Colors.white, size: 18),
        ),
        label: const Text(
          'Regenerate',
          style: TextStyle(
            fontFamily: 'Oriflame Sans 2.0',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
