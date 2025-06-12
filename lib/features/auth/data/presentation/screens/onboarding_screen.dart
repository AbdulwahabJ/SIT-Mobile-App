import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/login_screen.dart';
import 'package:sit_app/features/auth/data/presentation/screens/signup_screen.dart';

import '../../../../../core/network/shared_preferenes.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final introKey = GlobalKey<IntroductionScreenState>();

  void onIntroEnd(context) async {
    await TokenStorage.setOnboardingDone();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "مرحبا بك في تطبيق شركة سارا للعمرة",
          body: "دليلك الذكي لتنظيم رحلتك بكل سهولة",
          image: Center(
              child:
                  Image.asset("assets/images/company_logo.png", height: 175)),
        ),
        PageViewModel(
          title: "لا تفوّت أي حدث",
          body: "نذكّرك تلقائيًا بمواعيد العمرة والدروس والزيارات",
          image: Center(
            child: Image.asset("assets/images/company_logo.png", height: 175),
          ),
        ),
        PageViewModel(
          title: "دليل شامل لرحلتك",
          body:
              "استكشف مراحل رحلتك من العمرة إلى زيارة المدينة والمزارات الدينية، وكل ذلك في مكان واحد.",
          image: Center(
            child: Image.asset("assets/images/company_logo.png", height: 175),
          ),
        ),
        PageViewModel(
          title: "خدمة ميدانية مميزة",
          body:
              "فريقنا جاهز لخدمتك طوال الرحلة لضمان راحتك وتنظيم تنقلاتك بكل احترافية",
          image: Center(
            child: Image.asset("assets/images/company_logo.png", height: 175),
          ),
        ),
        PageViewModel(
          title: "ابدأ رحلتك الآن",
          body: "قم بتسجيل الان و استكشف مزايا التطبيق",
          image: Center(
              child:
                  Image.asset("assets/images/company_logo.png", height: 175)),
        ),
      ],
      onDone: () => onIntroEnd(context),
      showSkipButton: true,
      skip: const Text('تخطي'),
      next: const Icon(Icons.arrow_forward),
      done: const Text("ابدأ", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
