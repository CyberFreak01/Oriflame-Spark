# Smart Post UI - Flutter Assignment

This project is a high-fidelity, single-page Flutter UI implementation based on the provided Figma design for the Smart Post feature. It demonstrates modular architecture, advanced UX micro-interactions, and pixel-perfect styling.

## 🚀 How to Run the Project

1. **Prerequisites**: Ensure you have Flutter SDK installed (tested on `^3.10.7`).
2. **Install Dependencies**:
   Run the following command in your terminal from the project root:
   ```bash
   flutter pub get
   ```
3. **Run the App**:
   Attach your preferred device or emulator and run:
   ```bash
   flutter run
   ```

## 🏗️ Architecture & Structure
The original single-file `smart_post_ui.dart` monolithic code has been refactored into a scalable, **Clean Architecture / Feature-Based** structure:
- **`lib/core/`**: Contains globally reusable constants, theming (`AppColors`, `AppText`), and utility functions.
- **`lib/features/smart_post/`**: Modularized presentation layer housing `screens/`, `views/`, and specific `widgets/` so each component maintains a Single Responsibility.

## ✨ Custom Improvements & UX Touches (Bonus)
Several interactive UX touches have been implemented to make the application feel premium and responsive rather than just a static shell:

1. **Fluid AI Caption Expansion**: The `CaptionSuggestionBox` uses `AnimatedSize` to smoothly expand and collapse the caption body when tapping "see more" or the body text, rather than abruptly snapping.
2. **Smart "Save" Button**: On the `EditCaptionScreen`, the save button actively monitors the text field. It remains visually disabled and animates to Oriflame Green only when the user makes a real edit to the text.
3. **Regenerate Shimmer Effect**: Tapping the ✨ Regenerate button simulates an AI loading state by displaying a custom skeleton shimmer animation for 3 seconds before reloading the text.
4. **One-Tap Clipboard Copying**: In the expanded caption view, tapping on the referral code or referral link instantly copies it to the clipboard and triggers a sleek success `SnackBar`.
5. **Real Social Intents**: Implemented `url_launcher` with the appropriate Android `<queries>` to realistically attempt to open the native apps (Instagram, WhatsApp, Facebook) when you click a quick share button.
6. **Polished Layouts**:
   - Rebuilt the Avatar Overlay layout to properly vertically align the text next to the image.
   - Replaced full-width block buttons with sleek `FloatingActionButton.extended` widgets to give text fields more breathing room.
   - Wrapped the Bottom Navigation Bar in a `SafeArea` to prevent overlap with native OS gesture controls.

## 📝 Assumptions
- **State Management**: For this single-page UI translation, local `setState` was used as it perfectly demonstrates core Flutter proficiency without over-engineering. For a fully scaled production app, a simple Provider or Riverpod structure would be added to persist edits between screens.
- **Social Sharing**: Instagram does not accept prefilled text natively via URL schemes. As per standard behavior, the `ShareLoadingDialog` copies the text to the clipboard and redirects to the Instagram app, assuming the user will paste it manually.
