import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 12, bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.rotate(angle: -0.78, child: const Icon(Icons.near_me_outlined, color: Colors.white, size: 26)),
                const Icon(Icons.search, color: Colors.white, size: 26),
                const Icon(Icons.home_outlined, color: Colors.white, size: 26),
                const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 26),
                const Icon(Icons.person_outline, color: Colors.white, size: 26),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 117,
              height: 3,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2)),
            ),
          ],
        ),
      ),
    );
  }
}
