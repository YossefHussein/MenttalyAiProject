// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "home_screen": {
    "welcome_back": "اهلا بيك",
    "how_are_you_feeling_today": "إزاي بتحس دلوقتي ",
    "today_task": "مهام اليوم",
    "morning": "صبح",
    "noon": "عصر",
    "evening": "بليل",
    "happy_mood_button": "سعيد",
    "calm_mood_button": "هدوء",
    "relax_mood_button": "استرخاء",
    "focus_mood_button": "مركز",
    "my_mood_button": "مخصص"
  },
  "drawer_widget": {
    "about_developer": "عن مطورين",
    "tech_used_to_make_app": "التقنيات المستخدمة في تطبيق",
    "logout": "تسجيل خروج",
    "title_logout": "هل انت متأكد انك تخرج من تطبيق",
    "my_sir": "سيدي",
    "title_description": "هل انت متأكد انك عايز تخرج من بيئة للتأمل لي مسعادتك في انك تكوين وقت جميل للتأمل, ارجوك فكر من جديد وختر من اختيارين من موجودين تحت نص دة",
    "title_login_button": "تسجيل جروج ",
    "title_cancel_button": "كانسيل"
  },
  "song_playlist_screen": {
    "song_mood_angary": "غاضب",
    "song_mood_good": "كويس",
    "song_mood_good_place": "مكان كويس",
    "song_mood_sad": "حزين"
  }
};
static const Map<String,dynamic> en = {
  "home_screen": {
    "welcome_back": "Welcome Back",
    "how_are_you_feeling_today": "How Are You Feeling Today",
    "today_task": "Today Task",
    "morning": "Morning",
    "noon": "Noon",
    "evening": "Evening",
    "happy_mood_button": "Happy",
    "calm_mood_button": "Calm",
    "relax_mood_button": "Relax",
    "focus_mood_button": "Focus",
    "my_mood_button": "My Mood"
  },
  "drawer_widget": {
    "about_developer": "About Developer",
    "tech_used_to_make_app": "Tech Used To Make App",
    "logout": "LogOut",
    "title_logout": "Are You Sure Exit From Meditation",
    "my_sir": "My Sir",
    "title_description": "You Exit From Meditation environment to help YOU for make good Meditation time, Pleas think again and take option from these option under this text section",
    "title_login_button": "LogOut",
    "title_cancel_button": "Cancel"
  },
  "song_playlist_screen": {
    "song_mood_angary": "Angary",
    "song_mood_good": "Good",
    "song_mood_good_place": "Good Place",
    "song_mood_sad": "Sad"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
