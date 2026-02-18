import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/service/dio_client.dart';
import 'package:quickr_user_flutter_app/application/core/utils/typedefs.dart';
import 'package:quickr_user_flutter_app/application/core/utils/urls.dart';
import 'package:quickr_user_flutter_app/domain/address/i_address_facade.dart';
import 'package:quickr_user_flutter_app/domain/address/models/address_response.dart';
import 'package:quickr_user_flutter_app/domain/core/base/run_safely.dart';

@LazySingleton(as: IAddressFacade)
class IAddressFacadeImpl implements IAddressFacade {
  final DioClient dioClient;
  final RunSafely runSafely;

  IAddressFacadeImpl({required this.dioClient, required this.runSafely});

  @override
  ResultFuture<AddressResponse> getAddress() {
    return runSafely.runSafely(() async {
      final response = await dioClient.get(Urls.getAddresses);
      return AddressResponse.fromJson(response.data as Map<String, dynamic>);
    });
  }

  @override
  ResultFuture<bool> addAddress(Address address) {
    return runSafely.runSafely(() async {
      await dioClient.post(Urls.addAddress, data: address.toJson());
      return true;
    });
  }

  @override
  ResultFuture<bool> updateAddress(Address address) {
    return runSafely.runSafely(() async {
      await dioClient.post(Urls.updateAddress, data: address.toJson());
      return true;
    });
  }

  @override
  ResultFuture<bool> deleteAddress(int addressId) {
    return runSafely.runSafely(() async {
      await dioClient.post(Urls.deleteAddress, data: {"address_id": addressId});
      return true;
    });
  }
}
