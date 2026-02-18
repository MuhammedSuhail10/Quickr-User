part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ApiStatus getHomeStatus,
    HomeResponse? homeResponse,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    getHomeStatus: ApiStatus.initial,
    homeResponse: null,
    errorMessage: null,
  );
}
