import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';
import 'package:quickr_user_flutter_app/domain/home/i_home_facade.dart';

@LazySingleton(as: IHomeFacade)
class IHomeFacadeImpl implements IHomeFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IHomeFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<HomeResponse> getHomeData() {
    return runSafely.runSafely(() async {
      final response = await dioClient.get(
        Urls.getHome,
      );
      return HomeResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }
}