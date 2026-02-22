part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getHomeData() = GetHomeData;
  const factory HomeEvent.getAllCategories({
    required int lastId,
    String? searchQuery,
  }) = GetAllCategories;
  const factory HomeEvent.getSubCategoryServices({required int categoryId}) =
      GetSubCategoryServices;
}
