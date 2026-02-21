import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/booking/i_booking_facade.dart';
import 'package:quickr_user_flutter_app/domain/booking/models/booking_request.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';

@LazySingleton(as: IBookingFacade)
class IBookingFacadeImpl implements IBookingFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IBookingFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<bool> createOrder({required BookingRequest request}) {
    return runSafely.runSafely(() async {
      final formData = FormData.fromMap({
        'work_image': await MultipartFile.fromFile(request.workImage!.path),
        'data': jsonEncode(request.dataToJson()),
      });

      await dioClient.post(Urls.createOrder, data: formData);
      return true;
    });
  }
}
