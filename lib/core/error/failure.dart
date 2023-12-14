abstract class Failure {}

class InternetFailure implements Failure {}

class ServerFailure implements Failure {}

class BusinessFailure implements Failure {
  final String failureMessage;

  BusinessFailure({required this.failureMessage});
}
