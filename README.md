# Smart Post UI - Flutter Assignment

This project is a high-fidelity, Flutter UI implementation for the Smart Post feature. It demonstrates modular architecture, advanced UX micro-interactions, and pixel-perfect styling.

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
The flutter project implements a scalable, **Clean Architecture / Feature-Based** structure:
- **`lib/core/`**: Contains globally reusable constants, theming (`AppColors`, `AppText`), and utility functions.
- **`lib/features/smart_post/`**: Modularized presentation layer housing `screens/`, `views/`, and specific `widgets/` so each component maintains a Single Responsibility.

##  App Demo

Drive Link: https://drive.google.com/file/d/1VeOs0gwqv8zPhX0UXUGpdLk2TSae_IHB/view

## ✨ Custom Improvements & UX Touches (Bonus)
Several interactive UX touches have been implemented to make the application feel premium and responsive rather than just a static shell:

1. **Fluid AI Caption Expansion**: The `CaptionSuggestionBox` uses `AnimatedSize` to smoothly expand and collapse the caption body when tapping "see more" or the body text, rather than abruptly snapping.
2. **Regenerate Shimmer Effect**: Tapping the ✨ Regenerate button simulates an AI loading state by displaying a custom skeleton shimmer animation for 3 seconds before reloading the text.
3. **One-Tap Clipboard Copying**: In the expanded caption view, tapping on the referral code or referral link instantly copies it to the clipboard and triggers a sleek success `SnackBar`.
4. **Real Social Intents**: Implemented `url_launcher` with the appropriate Android `<queries>` to realistically attempt to open the native apps (Instagram, WhatsApp, Facebook) when you click a quick share button.

## 📝 Assumptions
- **State Management**: For this single-page UI translation, local `setState` was used as it perfectly demonstrates core Flutter proficiency without over-engineering. For a fully scaled production app, a simple Provider or Riverpod structure would be added to persist edits between screens.
- **Social Sharing**: Instagram does not accept prefilled text natively via URL schemes. As per standard behavior, the `ShareLoadingDialog` copies the text to the clipboard and redirects to the Instagram app, assuming the user will paste it manually.
