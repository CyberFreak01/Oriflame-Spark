import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text.dart';

class SongRecommendationBar extends StatelessWidget {
  const SongRecommendationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(color: AppColors.overlayDark(0.39), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: const [
          Icon(Icons.music_note, color: Colors.white, size: 18),
          SizedBox(width: 4),
          Text('RECOMMENDED: ', style: AppText.songLabel),
          Expanded(child: Text('Bad Habits by Ed Sheeran', style: AppText.songName, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
