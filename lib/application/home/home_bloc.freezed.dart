// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
    required TResult Function(int lastId, String? searchQuery) getAllCategories,
    required TResult Function(int categoryId) getSubCategoryServices,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
    TResult? Function(int lastId, String? searchQuery)? getAllCategories,
    TResult? Function(int categoryId)? getSubCategoryServices,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    TResult Function(int lastId, String? searchQuery)? getAllCategories,
    TResult Function(int categoryId)? getSubCategoryServices,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
    required TResult Function(GetAllCategories value) getAllCategories,
    required TResult Function(GetSubCategoryServices value)
    getSubCategoryServices,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeData value)? getHomeData,
    TResult? Function(GetAllCategories value)? getAllCategories,
    TResult? Function(GetSubCategoryServices value)? getSubCategoryServices,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    TResult Function(GetAllCategories value)? getAllCategories,
    TResult Function(GetSubCategoryServices value)? getSubCategoryServices,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetHomeDataImplCopyWith<$Res> {
  factory _$$GetHomeDataImplCopyWith(
    _$GetHomeDataImpl value,
    $Res Function(_$GetHomeDataImpl) then,
  ) = __$$GetHomeDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetHomeDataImpl>
    implements _$$GetHomeDataImplCopyWith<$Res> {
  __$$GetHomeDataImplCopyWithImpl(
    _$GetHomeDataImpl _value,
    $Res Function(_$GetHomeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHomeDataImpl implements GetHomeData {
  const _$GetHomeDataImpl();

  @override
  String toString() {
    return 'HomeEvent.getHomeData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
    required TResult Function(int lastId, String? searchQuery) getAllCategories,
    required TResult Function(int categoryId) getSubCategoryServices,
  }) {
    return getHomeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
    TResult? Function(int lastId, String? searchQuery)? getAllCategories,
    TResult? Function(int categoryId)? getSubCategoryServices,
  }) {
    return getHomeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    TResult Function(int lastId, String? searchQuery)? getAllCategories,
    TResult Function(int categoryId)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
    required TResult Function(GetAllCategories value) getAllCategories,
    required TResult Function(GetSubCategoryServices value)
    getSubCategoryServices,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeData value)? getHomeData,
    TResult? Function(GetAllCategories value)? getAllCategories,
    TResult? Function(GetSubCategoryServices value)? getSubCategoryServices,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    TResult Function(GetAllCategories value)? getAllCategories,
    TResult Function(GetSubCategoryServices value)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class GetHomeData implements HomeEvent {
  const factory GetHomeData() = _$GetHomeDataImpl;
}

/// @nodoc
abstract class _$$GetAllCategoriesImplCopyWith<$Res> {
  factory _$$GetAllCategoriesImplCopyWith(
    _$GetAllCategoriesImpl value,
    $Res Function(_$GetAllCategoriesImpl) then,
  ) = __$$GetAllCategoriesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int lastId, String? searchQuery});
}

/// @nodoc
class __$$GetAllCategoriesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetAllCategoriesImpl>
    implements _$$GetAllCategoriesImplCopyWith<$Res> {
  __$$GetAllCategoriesImplCopyWithImpl(
    _$GetAllCategoriesImpl _value,
    $Res Function(_$GetAllCategoriesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lastId = null, Object? searchQuery = freezed}) {
    return _then(
      _$GetAllCategoriesImpl(
        lastId: null == lastId
            ? _value.lastId
            : lastId // ignore: cast_nullable_to_non_nullable
                  as int,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$GetAllCategoriesImpl implements GetAllCategories {
  const _$GetAllCategoriesImpl({required this.lastId, this.searchQuery});

  @override
  final int lastId;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'HomeEvent.getAllCategories(lastId: $lastId, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesImpl &&
            (identical(other.lastId, lastId) || other.lastId == lastId) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastId, searchQuery);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesImplCopyWith<_$GetAllCategoriesImpl> get copyWith =>
      __$$GetAllCategoriesImplCopyWithImpl<_$GetAllCategoriesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
    required TResult Function(int lastId, String? searchQuery) getAllCategories,
    required TResult Function(int categoryId) getSubCategoryServices,
  }) {
    return getAllCategories(lastId, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
    TResult? Function(int lastId, String? searchQuery)? getAllCategories,
    TResult? Function(int categoryId)? getSubCategoryServices,
  }) {
    return getAllCategories?.call(lastId, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    TResult Function(int lastId, String? searchQuery)? getAllCategories,
    TResult Function(int categoryId)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getAllCategories != null) {
      return getAllCategories(lastId, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
    required TResult Function(GetAllCategories value) getAllCategories,
    required TResult Function(GetSubCategoryServices value)
    getSubCategoryServices,
  }) {
    return getAllCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeData value)? getHomeData,
    TResult? Function(GetAllCategories value)? getAllCategories,
    TResult? Function(GetSubCategoryServices value)? getSubCategoryServices,
  }) {
    return getAllCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    TResult Function(GetAllCategories value)? getAllCategories,
    TResult Function(GetSubCategoryServices value)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getAllCategories != null) {
      return getAllCategories(this);
    }
    return orElse();
  }
}

abstract class GetAllCategories implements HomeEvent {
  const factory GetAllCategories({
    required final int lastId,
    final String? searchQuery,
  }) = _$GetAllCategoriesImpl;

  int get lastId;
  String? get searchQuery;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAllCategoriesImplCopyWith<_$GetAllCategoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSubCategoryServicesImplCopyWith<$Res> {
  factory _$$GetSubCategoryServicesImplCopyWith(
    _$GetSubCategoryServicesImpl value,
    $Res Function(_$GetSubCategoryServicesImpl) then,
  ) = __$$GetSubCategoryServicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$$GetSubCategoryServicesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetSubCategoryServicesImpl>
    implements _$$GetSubCategoryServicesImplCopyWith<$Res> {
  __$$GetSubCategoryServicesImplCopyWithImpl(
    _$GetSubCategoryServicesImpl _value,
    $Res Function(_$GetSubCategoryServicesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categoryId = null}) {
    return _then(
      _$GetSubCategoryServicesImpl(
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetSubCategoryServicesImpl implements GetSubCategoryServices {
  const _$GetSubCategoryServicesImpl({required this.categoryId});

  @override
  final int categoryId;

  @override
  String toString() {
    return 'HomeEvent.getSubCategoryServices(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSubCategoryServicesImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSubCategoryServicesImplCopyWith<_$GetSubCategoryServicesImpl>
  get copyWith =>
      __$$GetSubCategoryServicesImplCopyWithImpl<_$GetSubCategoryServicesImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
    required TResult Function(int lastId, String? searchQuery) getAllCategories,
    required TResult Function(int categoryId) getSubCategoryServices,
  }) {
    return getSubCategoryServices(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getHomeData,
    TResult? Function(int lastId, String? searchQuery)? getAllCategories,
    TResult? Function(int categoryId)? getSubCategoryServices,
  }) {
    return getSubCategoryServices?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    TResult Function(int lastId, String? searchQuery)? getAllCategories,
    TResult Function(int categoryId)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getSubCategoryServices != null) {
      return getSubCategoryServices(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
    required TResult Function(GetAllCategories value) getAllCategories,
    required TResult Function(GetSubCategoryServices value)
    getSubCategoryServices,
  }) {
    return getSubCategoryServices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHomeData value)? getHomeData,
    TResult? Function(GetAllCategories value)? getAllCategories,
    TResult? Function(GetSubCategoryServices value)? getSubCategoryServices,
  }) {
    return getSubCategoryServices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    TResult Function(GetAllCategories value)? getAllCategories,
    TResult Function(GetSubCategoryServices value)? getSubCategoryServices,
    required TResult orElse(),
  }) {
    if (getSubCategoryServices != null) {
      return getSubCategoryServices(this);
    }
    return orElse();
  }
}

abstract class GetSubCategoryServices implements HomeEvent {
  const factory GetSubCategoryServices({required final int categoryId}) =
      _$GetSubCategoryServicesImpl;

  int get categoryId;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSubCategoryServicesImplCopyWith<_$GetSubCategoryServicesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  ApiStatus get getHomeStatus => throw _privateConstructorUsedError;
  HomeResponse? get homeResponse => throw _privateConstructorUsedError;
  ApiStatus get getAllCategoriesStatus => throw _privateConstructorUsedError;
  AllCategoriesResponse? get allCategoriesResponse =>
      throw _privateConstructorUsedError;
  ApiStatus get getSubCategoryServicesStatus =>
      throw _privateConstructorUsedError;
  ServiceResponse? get serviceResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    ApiStatus getHomeStatus,
    HomeResponse? homeResponse,
    ApiStatus getAllCategoriesStatus,
    AllCategoriesResponse? allCategoriesResponse,
    ApiStatus getSubCategoryServicesStatus,
    ServiceResponse? serviceResponse,
    String? errorMessage,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getHomeStatus = null,
    Object? homeResponse = freezed,
    Object? getAllCategoriesStatus = null,
    Object? allCategoriesResponse = freezed,
    Object? getSubCategoryServicesStatus = null,
    Object? serviceResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            getHomeStatus: null == getHomeStatus
                ? _value.getHomeStatus
                : getHomeStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            homeResponse: freezed == homeResponse
                ? _value.homeResponse
                : homeResponse // ignore: cast_nullable_to_non_nullable
                      as HomeResponse?,
            getAllCategoriesStatus: null == getAllCategoriesStatus
                ? _value.getAllCategoriesStatus
                : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            allCategoriesResponse: freezed == allCategoriesResponse
                ? _value.allCategoriesResponse
                : allCategoriesResponse // ignore: cast_nullable_to_non_nullable
                      as AllCategoriesResponse?,
            getSubCategoryServicesStatus: null == getSubCategoryServicesStatus
                ? _value.getSubCategoryServicesStatus
                : getSubCategoryServicesStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            serviceResponse: freezed == serviceResponse
                ? _value.serviceResponse
                : serviceResponse // ignore: cast_nullable_to_non_nullable
                      as ServiceResponse?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ApiStatus getHomeStatus,
    HomeResponse? homeResponse,
    ApiStatus getAllCategoriesStatus,
    AllCategoriesResponse? allCategoriesResponse,
    ApiStatus getSubCategoryServicesStatus,
    ServiceResponse? serviceResponse,
    String? errorMessage,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getHomeStatus = null,
    Object? homeResponse = freezed,
    Object? getAllCategoriesStatus = null,
    Object? allCategoriesResponse = freezed,
    Object? getSubCategoryServicesStatus = null,
    Object? serviceResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        getHomeStatus: null == getHomeStatus
            ? _value.getHomeStatus
            : getHomeStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        homeResponse: freezed == homeResponse
            ? _value.homeResponse
            : homeResponse // ignore: cast_nullable_to_non_nullable
                  as HomeResponse?,
        getAllCategoriesStatus: null == getAllCategoriesStatus
            ? _value.getAllCategoriesStatus
            : getAllCategoriesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        allCategoriesResponse: freezed == allCategoriesResponse
            ? _value.allCategoriesResponse
            : allCategoriesResponse // ignore: cast_nullable_to_non_nullable
                  as AllCategoriesResponse?,
        getSubCategoryServicesStatus: null == getSubCategoryServicesStatus
            ? _value.getSubCategoryServicesStatus
            : getSubCategoryServicesStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        serviceResponse: freezed == serviceResponse
            ? _value.serviceResponse
            : serviceResponse // ignore: cast_nullable_to_non_nullable
                  as ServiceResponse?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    required this.getHomeStatus,
    this.homeResponse,
    required this.getAllCategoriesStatus,
    this.allCategoriesResponse,
    required this.getSubCategoryServicesStatus,
    this.serviceResponse,
    this.errorMessage,
  });

  @override
  final ApiStatus getHomeStatus;
  @override
  final HomeResponse? homeResponse;
  @override
  final ApiStatus getAllCategoriesStatus;
  @override
  final AllCategoriesResponse? allCategoriesResponse;
  @override
  final ApiStatus getSubCategoryServicesStatus;
  @override
  final ServiceResponse? serviceResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(getHomeStatus: $getHomeStatus, homeResponse: $homeResponse, getAllCategoriesStatus: $getAllCategoriesStatus, allCategoriesResponse: $allCategoriesResponse, getSubCategoryServicesStatus: $getSubCategoryServicesStatus, serviceResponse: $serviceResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.getHomeStatus, getHomeStatus) ||
                other.getHomeStatus == getHomeStatus) &&
            (identical(other.homeResponse, homeResponse) ||
                other.homeResponse == homeResponse) &&
            (identical(other.getAllCategoriesStatus, getAllCategoriesStatus) ||
                other.getAllCategoriesStatus == getAllCategoriesStatus) &&
            (identical(other.allCategoriesResponse, allCategoriesResponse) ||
                other.allCategoriesResponse == allCategoriesResponse) &&
            (identical(
                  other.getSubCategoryServicesStatus,
                  getSubCategoryServicesStatus,
                ) ||
                other.getSubCategoryServicesStatus ==
                    getSubCategoryServicesStatus) &&
            (identical(other.serviceResponse, serviceResponse) ||
                other.serviceResponse == serviceResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getHomeStatus,
    homeResponse,
    getAllCategoriesStatus,
    allCategoriesResponse,
    getSubCategoryServicesStatus,
    serviceResponse,
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    required final ApiStatus getHomeStatus,
    final HomeResponse? homeResponse,
    required final ApiStatus getAllCategoriesStatus,
    final AllCategoriesResponse? allCategoriesResponse,
    required final ApiStatus getSubCategoryServicesStatus,
    final ServiceResponse? serviceResponse,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  @override
  ApiStatus get getHomeStatus;
  @override
  HomeResponse? get homeResponse;
  @override
  ApiStatus get getAllCategoriesStatus;
  @override
  AllCategoriesResponse? get allCategoriesResponse;
  @override
  ApiStatus get getSubCategoryServicesStatus;
  @override
  ServiceResponse? get serviceResponse;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
