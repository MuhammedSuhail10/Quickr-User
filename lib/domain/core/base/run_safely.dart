import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/logger.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/core/exception/custom_exception.dart';
import 'package:quickr_user_flutter_app/domain/core/failures/failures.dart';

@lazySingleton
class RunSafely {
  RunSafely();

  ResultFuture<T> runSafely<T>(
    Future<T> Function() action, {
    MainFailure Function(String error)? failure,
  }) async {
    try {
      return right(await action());
    } on CustomException catch (e) {
      Logger.logError('RunSafely Error : $e');
      return left(
        failure?.call(e.errMsg) ??
            MainFailure.customError(
              errorMsg: e.errMsg,
            ),
      );
    } catch (e) {
      Logger.logError('RunSafely Error : $e');
      return left(
        failure?.call(
              e.toString(),
            ) ??
            MainFailure.genericError(
              errorMsg: e.toString(),
            ),
      );
    }
  }
}
