import 'package:earn_store/Utils/snackbars.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelpers {
  static Future<void> openUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      Snackbars.unSuccessSnackBar(
        title: "Web Url",
        description: "Could not launch $url",
      );
    }
  }

  static Future<void> shareOnSocialMedia({required String url}) async {
    Share.share(
      url,
    );
  }
}
