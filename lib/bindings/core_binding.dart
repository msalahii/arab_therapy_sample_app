import 'package:arab_therapy_app/core/network/network_adapter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, request: true, responseBody: true));
    Get.put<NetworkAdapterAbstraction>(NetworkAdapter(dio: dio));
    Get.put<Connectivity>(Connectivity());
  }
}
