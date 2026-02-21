import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quickr_user_flutter_app/application/core/utils/debounce.dart';
import 'package:quickr_user_flutter_app/application/core/utils/enums.dart';
import 'package:quickr_user_flutter_app/domain/home/models/all_categories_response.dart';
import 'package:quickr_user_flutter_app/domain/home/models/home_response.dart';
import 'package:quickr_user_flutter_app/domain/home/i_home_facade.dart';

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
}
