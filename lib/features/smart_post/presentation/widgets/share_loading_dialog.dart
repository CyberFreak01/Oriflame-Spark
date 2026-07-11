import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _LoadingStep {
  final String label;
  final double progress; // 0..1, matches the Figma bar widths per state
  const _LoadingStep(this.label, this.progress);
}

class ShareLoadingDialog extends StatefulWidget {
  final String? captionToCopy;
  final VoidCallback onComplete;

  const ShareLoadingDialog({
    super.key,
    required this.onComplete,
    this.captionToCopy,
  });

  @override
  State<ShareLoadingDialog> createState() => _ShareLoadingDialogState();
}

class _ShareLoadingDialogState extends State<ShareLoadingDialog> {
  static const _steps = [
    _LoadingStep('Generating your sales link..', 0.34),
    _LoadingStep('Copying the caption to clipboard', 0.55),
    _LoadingStep('Saving the content to your profile', 0.78),
    _LoadingStep('Preparing the content for social media', 0.97),
  ];
  static const _stepDuration = Duration(milliseconds: 850);

  int _step = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_stepDuration, (t) async {
      if (_step == 1 && widget.captionToCopy != null) {
        await Clipboard.setData(ClipboardData(text: widget.captionToCopy!));
      }
      if (_step >= _steps.length - 1) {
        t.cancel();
        await Future.delayed(const Duration(milliseconds: 350));
        if (mounted) widget.onComplete();
        return;
      }
      setState(() => _step += 1);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 270,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 14, offset: const Offset(4, 4)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _SpinningLoadingIcon(),
              const SizedBox(height: 16),
              Text(
                _steps[_step].label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Oriflame Sans 2.0',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  height: 19 / 13,
                  color: Color(0xFFB1B1B1),
                ),
              ),
              const SizedBox(height: 12),
              _ProgressTrack(progress: _steps[_step].progress),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpinningLoadingIcon extends StatefulWidget {
  const _SpinningLoadingIcon();
  @override
  State<_SpinningLoadingIcon> createState() => _SpinningLoadingIconState();
}

class _SpinningLoadingIconState extends State<_SpinningLoadingIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(
        'assets/icons/loading_icon.png', // <- point this at your green swirl asset
        width: 64,
        height: 64,
        errorBuilder: (_, __, ___) => Container(
          width: 64,
          height: 64,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF9DD9BD)),
          child: const Icon(Icons.autorenew, color: Colors.white),
        ),
      ),
    );
  }
}

class _ProgressTrack extends StatelessWidget {
  final double progress;
  const _ProgressTrack({required this.progress});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 8,
            width: constraints.maxWidth,
            color: const Color(0xFFEEF3F0),
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.easeOut,
              height: 8,
              width: constraints.maxWidth * progress,
              color: const Color(0xFF9DD9BD),
            ),
          ),
        );
      },
    );
  }
}

Future<void> showShareLoadingDialog(
  BuildContext context, {
  required VoidCallback onComplete,
  String? captionToCopy,
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent, // blur does the dimming, not the barrier
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, anim1, anim2) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.05),
          child: ShareLoadingDialog(
            captionToCopy: captionToCopy,
            onComplete: () {
              Navigator.of(context).pop();
              onComplete();
            },
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) => FadeTransition(opacity: anim1, child: child),
  );
}
