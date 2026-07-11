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
  bool _isRegenerating = false;

  Future<void> _handleRegenerate() async {
    FocusScope.of(context).unfocus();
    setState(() => _isRegenerating = true);
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _isRegenerating = false;
        // Simulating the text is regenerated (we just keep the same text for the demo)
      });
    }
  }

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
                child: _isRegenerating 
                    ? const _CaptionShimmer() 
                    : TextField(
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
      floatingActionButton: _isRegenerating ? null : FloatingActionButton.extended(
        onPressed: _handleRegenerate,
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

class _CaptionShimmer extends StatefulWidget {
  const _CaptionShimmer();

  @override
  State<_CaptionShimmer> createState() => _CaptionShimmerState();
}

class _CaptionShimmerState extends State<_CaptionShimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animController,
      builder: (context, child) {
        return Opacity(
          opacity: 0.3 + (_animController.value * 0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 18, width: double.infinity, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)), margin: const EdgeInsets.only(bottom: 12)),
              Container(height: 18, width: double.infinity, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)), margin: const EdgeInsets.only(bottom: 12)),
              Container(height: 18, width: MediaQuery.of(context).size.width * 0.8, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)), margin: const EdgeInsets.only(bottom: 12)),
              const SizedBox(height: 16),
              Container(height: 18, width: MediaQuery.of(context).size.width * 0.6, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4)), margin: const EdgeInsets.only(bottom: 12)),
              Container(height: 18, width: MediaQuery.of(context).size.width * 0.4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(4))),
            ],
          ),
        );
      },
    );
  }
}
