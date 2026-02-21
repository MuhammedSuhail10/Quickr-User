import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';
import 'package:quickr_user_flutter_app/domain/home/models/all_categories_response.dart';
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
      final response = await dioClient.get(Urls.getHome);
      return HomeResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<AllCategoriesResponse> getAllCategories({
    int? lastId,
    String? searchQuery,
  }) {
    return runSafely.runSafely(() async {
      final response = await dioClient.get(
        Urls.allCategories,
        queryParameters: {
          'last_id': lastId ?? 0,
          if (searchQuery != null && searchQuery.isNotEmpty)
            'search_query': searchQuery,
        },
      );
      return AllCategoriesResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    });
  }
}
