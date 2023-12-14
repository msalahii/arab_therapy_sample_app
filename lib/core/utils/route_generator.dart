import 'package:arab_therapy_app/bindings/sample_data_binding.dart';
import 'package:arab_therapy_app/presentation/views/home_view.dart';
import 'package:arab_therapy_app/presentation/views/sample_data_view.dart';
import 'package:get/get.dart';

import '../../presentation/views/splash_view.dart';

class ArabTherapyRoutes {
  static List<GetPage> routesList = [
    GetPage(name: SplashView.routeName, page: () => SplashView()),
    GetPage(name: HomeView.routeName, page: () => const HomeView()),
    GetPage(name: SampleDataView.routeName, page: () => SampleDataView(), binding: SampleDataBinding()),
  ];
}
