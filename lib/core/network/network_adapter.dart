import 'package:arab_therapy_app/core/network/response_model.dart';
import 'package:dio/dio.dart';
import '../error/failure.dart';

enum RequestType { get, post, put, patch, delete }

abstract class NetworkAdapterAbstraction {
  Future<ResponseModel> request(String networkRoute, RequestType requestType, Map<String, dynamic>? data);
}

class NetworkAdapter implements NetworkAdapterAbstraction {
  final Dio _dio;
  NetworkAdapter({required Dio dio}) : _dio = dio;

  @override
  Future<ResponseModel> request(String networkRoute, RequestType requestType, Map<String, dynamic>? data) async {
    late Response response;
    late ResponseStatus status;
    String? message;
    Failure? failure;
    dynamic data;
    try {
      const baseURL = "https://api.slingacademy.com/v1/";
      Options? requestOptions;

      switch (requestType) {
        case RequestType.post:
          response = await _dio.post(baseURL + networkRoute, data: data, options: requestOptions);
          break;
        case RequestType.get:
          response = await _dio.get(baseURL + networkRoute, queryParameters: data, options: requestOptions);
          break;
        case RequestType.patch:
          response = await _dio.patch(baseURL + networkRoute, data: data, options: requestOptions);
          break;
        case RequestType.put:
          response = await _dio.put(baseURL + networkRoute, data: data, options: requestOptions);
          break;
        case RequestType.delete:
          response = await _dio.delete(baseURL + networkRoute, data: data, options: requestOptions);
          break;
      }

      if (response.data['success'] == false) {
        status = ResponseStatus.failure;
        message = response.data['message'];
        failure = BusinessFailure(failureMessage: message!);
      } else if (response.data['success'] == true) {
        status = ResponseStatus.success;
        data = response.data['photos'];
        message = response.data['message'];
      }
    } on DioException catch (dioError) {
      status = ResponseStatus.failure;
      if (dioError.response != null) {
        failure = ServerFailure();
      } else {
        failure = InternetFailure();
      }
    }

    return ResponseModel(responseStatus: status, data: data, message: message, failure: failure);
  }
}
