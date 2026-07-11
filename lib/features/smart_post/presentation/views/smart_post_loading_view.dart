import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';
import '../widgets/smart_post_header.dart';

enum _StepState { pending, active, done }

class SmartPostLoadingView extends StatefulWidget {
  final VoidCallback onFinished;
  const SmartPostLoadingView({super.key, required this.onFinished});

  @override
  State<SmartPostLoadingView> createState() => _SmartPostLoadingViewState();
}

class _SmartPostLoadingViewState extends State<SmartPostLoadingView> {
  static const _labels = [
    'Preparing popular content for you',
    'Crafting a caption to boost engagement',
    'Adding your personal referral link and code',
    'Finding trending songs on other social media',
  ];

  late List<_StepState> _states;
  bool _allSet = false;
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    _states = List.generate(_labels.length, (i) => i == 0 ? _StepState.active : _StepState.pending);
    for (var i = 0; i < _labels.length; i++) {
      _timers.add(Timer(Duration(milliseconds: 900 * (i + 1)), () {
        if (!mounted) return;
        setState(() {
          _states[i] = _StepState.done;
          if (i + 1 < _states.length) _states[i + 1] = _StepState.active;
          if (i == _labels.length - 1) _allSet = true;
        });
      }));
    }
    _timers.add(Timer(Duration(milliseconds: 900 * _labels.length + 900), widget.onFinished));
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SmartPostHeader(showAssistant: false),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Building personalised\nSmart Posts for you!',
                    textAlign: TextAlign.center,
                    style: AppText.loadingHeading,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(_labels.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _StepIcon(state: _states[i]),
                            const SizedBox(width: 12),
                            Flexible(
                              child: Text(
                                _labels[i],
                                style: _states[i] == _StepState.pending
                                    ? AppText.loadingItemPending
                                    : AppText.loadingItemActive,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  AnimatedOpacity(
                    opacity: _allSet ? 1 : 0,
                    duration: const Duration(milliseconds: 400),
                    child: const Text('All set! Get ready to share...', style: AppText.loadingAllSet),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _StepIcon extends StatelessWidget {
  final _StepState state;
  const _StepIcon({required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case _StepState.done:
        return const Icon(Icons.check_circle, color: AppColors.loadingGreenLight, size: 20);
      case _StepState.active:
        return const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.loadingGreenLight),
        );
      case _StepState.pending:
        return Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.radioEmpty, width: 2)),
        );
    }
  }
}
