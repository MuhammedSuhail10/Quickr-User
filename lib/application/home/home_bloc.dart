import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/debounce.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/home/models/all_categories_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';
import 'package:quickr_user_flutter_app/domain/home/i_home_facade.dart';
import 'package:quickr_user_flutter_app/domain/home/models/services_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/scheduled_order_response.dart';

import 'package:quickr_user_flutter_app/domain/home/models/worker_details_response.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeFacade _homeFacade;

  HomeBloc(this._homeFacade) : super(HomeState.initial()) {
    on<GetHomeData>(_getHomeData);
    on<GetAllCategories>(
      _getAllCategories,
      transformer: debounce(const Duration(milliseconds: 300)),
    );
    on<GetSubCategoryServices>(_getSubCategoryServices);
    on<GetScheduledOrders>(_getScheduledOrders);
    on<VerifyOrder>(_verifyOrder);
    on<GetWorkerDetails>(_getWorkerDetails);
    on<ResetVerifyOrderStatus>(_resetVerifyOrderStatus);
  }

  Future<void> _getWorkerDetails(
    GetWorkerDetails event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        getWorkerDetailsStatus: ApiStatus.loading,
        workerDetailsResponse: null,
        errorMessage: null,
      ),
    );

    final result = await _homeFacade.getWorkerDetails(orderId: event.orderId);

    result.fold(
      (failure) => emit(
        state.copyWith(
          getWorkerDetailsStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getWorkerDetailsStatus: ApiStatus.success,
          workerDetailsResponse: response,
        ),
      ),
    );
  }

  Future<void> _getHomeData(GetHomeData event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        getHomeStatus: ApiStatus.loading,
        errorMessage: null,
        homeResponse: null,
      ),
    );

    final result = await _homeFacade.getHomeData();

    result.fold(
      (failure) => emit(
        state.copyWith(
          getHomeStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getHomeStatus: ApiStatus.success,
          homeResponse: response,
        ),
      ),
    );
  }

  Future<void> _getAllCategories(
    GetAllCategories event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        getAllCategoriesStatus: ApiStatus.loading,
        errorMessage: null,
      ),
    );

    final result = await _homeFacade.getAllCategories(
      lastId: event.lastId,
      searchQuery: event.searchQuery,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          getAllCategoriesStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getAllCategoriesStatus: ApiStatus.success,
          allCategoriesResponse: response,
        ),
      ),
    );
  }

  Future<void> _getSubCategoryServices(
    GetSubCategoryServices event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        getSubCategoryServicesStatus: ApiStatus.loading,
        errorMessage: null,
        serviceResponse: null,
      ),
    );

    final result = await _homeFacade.getSubCategoryServices(
      categoryId: event.categoryId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          getSubCategoryServicesStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getSubCategoryServicesStatus: ApiStatus.success,
          serviceResponse: response,
        ),
      ),
    );
  }

  Future<void> _getScheduledOrders(
    GetScheduledOrders event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(getScheduledOrdersStatus: ApiStatus.loading));

    final result = await _homeFacade.getScheduledOrders();

    result.fold(
      (failure) => emit(
        state.copyWith(
          getScheduledOrdersStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (response) => emit(
        state.copyWith(
          getScheduledOrdersStatus: ApiStatus.success,
          scheduledOrderResponse: response,
        ),
      ),
    );
  }

  Future<void> _verifyOrder(VerifyOrder event, Emitter<HomeState> emit) async {
    emit(state.copyWith(verifyOrderStatus: ApiStatus.loading));

    final result = await _homeFacade.verifyOrder(
      orderId: event.orderId,
      otp: event.otp,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          verifyOrderStatus: ApiStatus.error,
          errorMessage: failure.errorMsg,
        ),
      ),
      (_) => emit(state.copyWith(verifyOrderStatus: ApiStatus.success)),
    );
  }

  void _resetVerifyOrderStatus(
    ResetVerifyOrderStatus event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(verifyOrderStatus: ApiStatus.initial, errorMessage: null),
    );
  }
}
