import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PageDotsIndicator extends StatelessWidget {
  final int index;
  final int total;
  const PageDotsIndicator({super.key, required this.index, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: AppColors.pillDark(0.56), borderRadius: BorderRadius.circular(13)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(total, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: i == total - 1 ? 0 : 8),
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i == index ? AppColors.oriflameGreen : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}
