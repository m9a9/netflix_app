import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure(
            'Connection Timeout with the Server,Please check you internet Connection and try again!!');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with the Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Recieve Timeout with the Server');

      case DioErrorType.badCertificate:
        return ServerFailure('oops Bad Certificate!!');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFailure('Your Request was Cancelled , PLease Try Later!!');

      case DioErrorType.connectionError:
        return ServerFailure(
            'Ther is an Error with your Connection , PLease Try Later!!');

      case DioErrorType.unknown:
        return ServerFailure('Your Request was Cancelled , PLease Try Later!!');
      default:
        return ServerFailure('Opps, ther was an erroe ,Please try Later!!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['status_message']);
    } else if (statusCode == 404) {
      return ServerFailure('You Request Not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error,Please Try Later!!');
    }
    return ServerFailure('Opps, ther was an erroe ,Please try Later!!');
  }
}
