import 'package:arab_therapy_app/presentation/views/home_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(HomeView.routeName);
    });
  }
}
