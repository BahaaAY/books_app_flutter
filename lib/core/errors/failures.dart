import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(String errorMsg) : super(errorMsg);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timedout, please try again!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timedout, please try again!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timedout, please try again!');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate, please try again!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Operation Canceled!');
      case DioExceptionType.connectionError:
        if (dioException.message != null) {
          if (dioException.message!.contains('SocketException')) {
            return ServerFailure('No Internet Connection');
          }
        }
        return ServerFailure('Unknown Connection Error, please try again!');
      case DioExceptionType.unknown:
        return ServerFailure(dioException.error.toString());

      default:
        return ServerFailure('Opps something went wrong, please try again!');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
