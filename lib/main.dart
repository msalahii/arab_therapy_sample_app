import 'package:arab_therapy_app/bindings/core_binding.dart';
import 'package:arab_therapy_app/core/utils/route_generator.dart';
import 'package:arab_therapy_app/core/utils/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [AppConstants.arabicLocale],
      path: 'assets/translations',
      fallbackLocale: AppConstants.arabicLocale,
      child: const ArabTherapyApp()));
}

class ArabTherapyApp extends StatelessWidget {
  const ArabTherapyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Arab Therapy',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialBinding: CoreBinding(),
      initialRoute: SplashView.routeName,
      getPages: ArabTherapyRoutes.routesList,
    );
  }
}
