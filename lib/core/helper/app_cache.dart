import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:sit_app/core/constants/app_text.dart';
import '../utils/app_images.dart';

class AppCache {
  static List<Map<String, String>> guiedItems = [
    {
      'image': AppImages.umrahGuiedImage,
      'label': AppTexts.umrahGuiedLabel,
      'link': '', // مبدئيًا فاضي
    },
    {
      'image': AppImages.madinGuiedImage,
      'label': AppTexts.madinaGuiedLabel,
      'link': '',
    },
    {
      'image': AppImages.mazaratGuiedImage,
      'label': AppTexts.mazaratGuiedLabel,
      'link': '',
    },
  ];

  Future<void> preloadFiles() async {
    try {
      print("🔄 بدء تحميل ملفات الأدلة...");

      final umrahFile =
          await DefaultCacheManager().getSingleFile(AppTexts.umrahGuiedLinke);
      guiedItems[0]['link'] = umrahFile.path;
      print("✅ تم تحميل Umrah Guide");

      final madinaFile =
          await DefaultCacheManager().getSingleFile(AppTexts.madinaGuiedLinke);
      guiedItems[1]['link'] = madinaFile.path;
      print("✅ تم تحميل Madina Guide");

      final mazaratFile =
          await DefaultCacheManager().getSingleFile(AppTexts.mazaratGuiedLinke);
      guiedItems[2]['link'] = mazaratFile.path;
      print("✅ تم تحميل Mazarat Guide");
    } catch (e) {
      print("❌ فشل تحميل ملفات الكاش: $e");
    }
  }
}
