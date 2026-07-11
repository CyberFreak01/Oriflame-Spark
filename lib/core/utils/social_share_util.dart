import 'package:url_launcher/url_launcher.dart';

enum SharePlatform { instagram, whatsapp, facebook, telegram, messenger, tiktok, twitter }

Future<void> launchSocialShare(SharePlatform platform, {String caption = ''}) async {
  final encoded = Uri.encodeComponent(caption);
  late final Uri appUri;
  late final Uri fallbackUri;

  switch (platform) {
    case SharePlatform.whatsapp:
      appUri = Uri.parse('whatsapp://send?text=$encoded');
      fallbackUri = Uri.parse('https://wa.me/?text=$encoded');
      break;
    case SharePlatform.instagram:
      // IG's scheme doesn't accept a prefilled caption — it's already on the
      // clipboard from step 2, user pastes it into the composer.
      appUri = Uri.parse('instagram://app');
      fallbackUri = Uri.parse('https://www.instagram.com/');
      break;
    case SharePlatform.facebook:
      appUri = Uri.parse('fb://composer');
      fallbackUri = Uri.parse('https://www.facebook.com/');
      break;
    case SharePlatform.telegram:
      appUri = Uri.parse('tg://msg?text=$encoded');
      fallbackUri = Uri.parse('https://t.me/share/url?text=$encoded');
      break;
    case SharePlatform.messenger:
      appUri = Uri.parse('fb-messenger://share');
      fallbackUri = Uri.parse('https://www.messenger.com/');
      break;
    case SharePlatform.tiktok:
      appUri = Uri.parse('tiktok://');
      fallbackUri = Uri.parse('https://www.tiktok.com/');
      break;
    case SharePlatform.twitter:
      appUri = Uri.parse('twitter://post?message=$encoded');
      fallbackUri = Uri.parse('https://twitter.com/intent/tweet?text=$encoded');
      break;
  }

  if (await canLaunchUrl(appUri)) {
    await launchUrl(appUri);
  } else {
    await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
  }
}
