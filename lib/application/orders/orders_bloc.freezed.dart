// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrdersEvent {
  int get lastScheduledId => throw _privateConstructorUsedError;
  int get lastOtherId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int lastScheduledId, int lastOtherId) getOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int lastScheduledId, int lastOtherId)? getOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int lastScheduledId, int lastOtherId)? getOrders,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersEventCopyWith<OrdersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
    OrdersEvent value,
    $Res Function(OrdersEvent) then,
  ) = _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
  @useResult
  $Res call({int lastScheduledId, int lastOtherId});
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lastScheduledId = null, Object? lastOtherId = null}) {
    return _then(
      _value.copyWith(
            lastScheduledId: null == lastScheduledId
                ? _value.lastScheduledId
                : lastScheduledId // ignore: cast_nullable_to_non_nullable
                      as int,
            lastOtherId: null == lastOtherId
                ? _value.lastOtherId
                : lastOtherId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetOrdersImplCopyWith<$Res>
    implements $OrdersEventCopyWith<$Res> {
  factory _$$GetOrdersImplCopyWith(
    _$GetOrdersImpl value,
    $Res Function(_$GetOrdersImpl) then,
  ) = __$$GetOrdersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int lastScheduledId, int lastOtherId});
}

/// @nodoc
class __$$GetOrdersImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$GetOrdersImpl>
    implements _$$GetOrdersImplCopyWith<$Res> {
  __$$GetOrdersImplCopyWithImpl(
    _$GetOrdersImpl _value,
    $Res Function(_$GetOrdersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lastScheduledId = null, Object? lastOtherId = null}) {
    return _then(
      _$GetOrdersImpl(
        lastScheduledId: null == lastScheduledId
            ? _value.lastScheduledId
            : lastScheduledId // ignore: cast_nullable_to_non_nullable
                  as int,
        lastOtherId: null == lastOtherId
            ? _value.lastOtherId
            : lastOtherId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GetOrdersImpl implements GetOrders {
  const _$GetOrdersImpl({this.lastScheduledId = 0, this.lastOtherId = 0});

  @override
  @JsonKey()
  final int lastScheduledId;
  @override
  @JsonKey()
  final int lastOtherId;

  @override
  String toString() {
    return 'OrdersEvent.getOrders(lastScheduledId: $lastScheduledId, lastOtherId: $lastOtherId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOrdersImpl &&
            (identical(other.lastScheduledId, lastScheduledId) ||
                other.lastScheduledId == lastScheduledId) &&
            (identical(other.lastOtherId, lastOtherId) ||
                other.lastOtherId == lastOtherId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastScheduledId, lastOtherId);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOrdersImplCopyWith<_$GetOrdersImpl> get copyWith =>
      __$$GetOrdersImplCopyWithImpl<_$GetOrdersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int lastScheduledId, int lastOtherId) getOrders,
  }) {
    return getOrders(lastScheduledId, lastOtherId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int lastScheduledId, int lastOtherId)? getOrders,
  }) {
    return getOrders?.call(lastScheduledId, lastOtherId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int lastScheduledId, int lastOtherId)? getOrders,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(lastScheduledId, lastOtherId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
  }) {
    return getOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
  }) {
    return getOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(this);
    }
    return orElse();
  }
}

abstract class GetOrders implements OrdersEvent {
  const factory GetOrders({final int lastScheduledId, final int lastOtherId}) =
      _$GetOrdersImpl;

  @override
  int get lastScheduledId;
  @override
  int get lastOtherId;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOrdersImplCopyWith<_$GetOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrdersState {
  ApiStatus get getOrdersStatus => throw _privateConstructorUsedError;
  OrdersResponse? get ordersResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrdersStateCopyWith<OrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
    OrdersState value,
    $Res Function(OrdersState) then,
  ) = _$OrdersStateCopyWithImpl<$Res, OrdersState>;
  @useResult
  $Res call({
    ApiStatus getOrdersStatus,
    OrdersResponse? ordersResponse,
    String? errorMessage,
  });
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrdersStatus = null,
    Object? ordersResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            getOrdersStatus: null == getOrdersStatus
                ? _value.getOrdersStatus
                : getOrdersStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            ordersResponse: freezed == ordersResponse
                ? _value.ordersResponse
                : ordersResponse // ignore: cast_nullable_to_non_nullable
                      as OrdersResponse?,
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
abstract class _$$OrdersStateImplCopyWith<$Res>
    implements $OrdersStateCopyWith<$Res> {
  factory _$$OrdersStateImplCopyWith(
    _$OrdersStateImpl value,
    $Res Function(_$OrdersStateImpl) then,
  ) = __$$OrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ApiStatus getOrdersStatus,
    OrdersResponse? ordersResponse,
    String? errorMessage,
  });
}

/// @nodoc
class __$$OrdersStateImplCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$OrdersStateImpl>
    implements _$$OrdersStateImplCopyWith<$Res> {
  __$$OrdersStateImplCopyWithImpl(
    _$OrdersStateImpl _value,
    $Res Function(_$OrdersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getOrdersStatus = null,
    Object? ordersResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$OrdersStateImpl(
        getOrdersStatus: null == getOrdersStatus
            ? _value.getOrdersStatus
            : getOrdersStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        ordersResponse: freezed == ordersResponse
            ? _value.ordersResponse
            : ordersResponse // ignore: cast_nullable_to_non_nullable
                  as OrdersResponse?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OrdersStateImpl implements _OrdersState {
  const _$OrdersStateImpl({
    required this.getOrdersStatus,
    this.ordersResponse,
    this.errorMessage,
  });

  @override
  final ApiStatus getOrdersStatus;
  @override
  final OrdersResponse? ordersResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OrdersState(getOrdersStatus: $getOrdersStatus, ordersResponse: $ordersResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.getOrdersStatus, getOrdersStatus) ||
                other.getOrdersStatus == getOrdersStatus) &&
            (identical(other.ordersResponse, ordersResponse) ||
                other.ordersResponse == ordersResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, getOrdersStatus, ordersResponse, errorMessage);

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      __$$OrdersStateImplCopyWithImpl<_$OrdersStateImpl>(this, _$identity);
}

abstract class _OrdersState implements OrdersState {
  const factory _OrdersState({
    required final ApiStatus getOrdersStatus,
    final OrdersResponse? ordersResponse,
    final String? errorMessage,
  }) = _$OrdersStateImpl;

  @override
  ApiStatus get getOrdersStatus;
  @override
  OrdersResponse? get ordersResponse;
  @override
  String? get errorMessage;

  /// Create a copy of OrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrdersStateImplCopyWith<_$OrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
