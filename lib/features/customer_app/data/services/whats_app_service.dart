import 'package:url_launcher/url_launcher.dart';

void openWhatsApp({required String phoneNumber, required String text}) async {
  //
  String whatsappUrl = 'https://wa.me/$phoneNumber?text=$text';

  final uri = Uri.parse(whatsappUrl);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}
