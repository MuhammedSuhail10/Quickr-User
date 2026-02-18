import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';

abstract interface class IHomeFacade {
  ResultFuture<HomeResponse> getHomeData();
}
