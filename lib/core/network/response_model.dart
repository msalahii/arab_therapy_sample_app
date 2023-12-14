import '../error/failure.dart';

enum ResponseStatus { success, failure }

class ResponseModel {
  final Failure? failure;
  final String? message;
  final dynamic data;
  final ResponseStatus responseStatus;

  ResponseModel({required this.failure, required this.message, required this.data, required this.responseStatus});
}
