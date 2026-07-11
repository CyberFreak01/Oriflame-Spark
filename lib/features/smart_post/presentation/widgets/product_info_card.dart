import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';

class ProductInfoCard extends StatelessWidget {
  const ProductInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 199,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: AppColors.overlayLight(0.39), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.asset(
              AppAssets.productThumb,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(width: 40, height: 40, color: Colors.white24),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Girodani Gold Lipstick', style: AppText.productName, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('\$14.99', style: AppText.productPrice),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.oriflameGreenDark,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('30% off', style: AppText.discountBadge),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
