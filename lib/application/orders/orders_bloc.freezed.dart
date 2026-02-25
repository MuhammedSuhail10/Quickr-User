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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
    OrdersEvent value,
    $Res Function(OrdersEvent) then,
  ) = _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
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
}

/// @nodoc
abstract class _$$GetOrdersImplCopyWith<$Res> {
  factory _$$GetOrdersImplCopyWith(
    _$GetOrdersImpl value,
    $Res Function(_$GetOrdersImpl) then,
  ) = __$$GetOrdersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? lastScheduledId, int? lastOtherId});
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
  $Res call({
    Object? lastScheduledId = freezed,
    Object? lastOtherId = freezed,
  }) {
    return _then(
      _$GetOrdersImpl(
        lastScheduledId: freezed == lastScheduledId
            ? _value.lastScheduledId
            : lastScheduledId // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastOtherId: freezed == lastOtherId
            ? _value.lastOtherId
            : lastOtherId // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$GetOrdersImpl implements GetOrders {
  const _$GetOrdersImpl({this.lastScheduledId, this.lastOtherId});

  @override
  final int? lastScheduledId;
  @override
  final int? lastOtherId;

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
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return getOrders(lastScheduledId, lastOtherId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return getOrders?.call(lastScheduledId, lastOtherId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
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
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return getOrders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return getOrders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (getOrders != null) {
      return getOrders(this);
    }
    return orElse();
  }
}

abstract class GetOrders implements OrdersEvent {
  const factory GetOrders({
    final int? lastScheduledId,
    final int? lastOtherId,
  }) = _$GetOrdersImpl;

  int? get lastScheduledId;
  int? get lastOtherId;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOrdersImplCopyWith<_$GetOrdersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RescheduleOrderImplCopyWith<$Res> {
  factory _$$RescheduleOrderImplCopyWith(
    _$RescheduleOrderImpl value,
    $Res Function(_$RescheduleOrderImpl) then,
  ) = __$$RescheduleOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, String scheduledDate, String scheduledTime});
}

/// @nodoc
class __$$RescheduleOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$RescheduleOrderImpl>
    implements _$$RescheduleOrderImplCopyWith<$Res> {
  __$$RescheduleOrderImplCopyWithImpl(
    _$RescheduleOrderImpl _value,
    $Res Function(_$RescheduleOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? scheduledDate = null,
    Object? scheduledTime = null,
  }) {
    return _then(
      _$RescheduleOrderImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduledDate: null == scheduledDate
            ? _value.scheduledDate
            : scheduledDate // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduledTime: null == scheduledTime
            ? _value.scheduledTime
            : scheduledTime // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RescheduleOrderImpl implements RescheduleOrder {
  const _$RescheduleOrderImpl({
    required this.orderId,
    required this.scheduledDate,
    required this.scheduledTime,
  });

  @override
  final int orderId;
  @override
  final String scheduledDate;
  @override
  final String scheduledTime;

  @override
  String toString() {
    return 'OrdersEvent.rescheduleOrder(orderId: $orderId, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduleOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, scheduledDate, scheduledTime);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RescheduleOrderImplCopyWith<_$RescheduleOrderImpl> get copyWith =>
      __$$RescheduleOrderImplCopyWithImpl<_$RescheduleOrderImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return rescheduleOrder(orderId, scheduledDate, scheduledTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return rescheduleOrder?.call(orderId, scheduledDate, scheduledTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (rescheduleOrder != null) {
      return rescheduleOrder(orderId, scheduledDate, scheduledTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return rescheduleOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return rescheduleOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (rescheduleOrder != null) {
      return rescheduleOrder(this);
    }
    return orElse();
  }
}

abstract class RescheduleOrder implements OrdersEvent {
  const factory RescheduleOrder({
    required final int orderId,
    required final String scheduledDate,
    required final String scheduledTime,
  }) = _$RescheduleOrderImpl;

  int get orderId;
  String get scheduledDate;
  String get scheduledTime;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RescheduleOrderImplCopyWith<_$RescheduleOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelOrderImplCopyWith<$Res> {
  factory _$$CancelOrderImplCopyWith(
    _$CancelOrderImpl value,
    $Res Function(_$CancelOrderImpl) then,
  ) = __$$CancelOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, String cancellationReason});
}

/// @nodoc
class __$$CancelOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$CancelOrderImpl>
    implements _$$CancelOrderImplCopyWith<$Res> {
  __$$CancelOrderImplCopyWithImpl(
    _$CancelOrderImpl _value,
    $Res Function(_$CancelOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? cancellationReason = null}) {
    return _then(
      _$CancelOrderImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        cancellationReason: null == cancellationReason
            ? _value.cancellationReason
            : cancellationReason // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CancelOrderImpl implements CancelOrder {
  const _$CancelOrderImpl({
    required this.orderId,
    required this.cancellationReason,
  });

  @override
  final int orderId;
  @override
  final String cancellationReason;

  @override
  String toString() {
    return 'OrdersEvent.cancelOrder(orderId: $orderId, cancellationReason: $cancellationReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, cancellationReason);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      __$$CancelOrderImplCopyWithImpl<_$CancelOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return cancelOrder(orderId, cancellationReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return cancelOrder?.call(orderId, cancellationReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(orderId, cancellationReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class CancelOrder implements OrdersEvent {
  const factory CancelOrder({
    required final int orderId,
    required final String cancellationReason,
  }) = _$CancelOrderImpl;

  int get orderId;
  String get cancellationReason;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelOrderImplCopyWith<_$CancelOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOrderImplCopyWith<$Res> {
  factory _$$VerifyOrderImplCopyWith(
    _$VerifyOrderImpl value,
    $Res Function(_$VerifyOrderImpl) then,
  ) = __$$VerifyOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int orderId, int otp});
}

/// @nodoc
class __$$VerifyOrderImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$VerifyOrderImpl>
    implements _$$VerifyOrderImplCopyWith<$Res> {
  __$$VerifyOrderImplCopyWithImpl(
    _$VerifyOrderImpl _value,
    $Res Function(_$VerifyOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? orderId = null, Object? otp = null}) {
    return _then(
      _$VerifyOrderImpl(
        orderId: null == orderId
            ? _value.orderId
            : orderId // ignore: cast_nullable_to_non_nullable
                  as int,
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$VerifyOrderImpl implements VerifyOrder {
  const _$VerifyOrderImpl({required this.orderId, required this.otp});

  @override
  final int orderId;
  @override
  final int otp;

  @override
  String toString() {
    return 'OrdersEvent.verifyOrder(orderId: $orderId, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, otp);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOrderImplCopyWith<_$VerifyOrderImpl> get copyWith =>
      __$$VerifyOrderImplCopyWithImpl<_$VerifyOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return verifyOrder(orderId, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return verifyOrder?.call(orderId, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (verifyOrder != null) {
      return verifyOrder(orderId, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return verifyOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return verifyOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (verifyOrder != null) {
      return verifyOrder(this);
    }
    return orElse();
  }
}

abstract class VerifyOrder implements OrdersEvent {
  const factory VerifyOrder({
    required final int orderId,
    required final int otp,
  }) = _$VerifyOrderImpl;

  int get orderId;
  int get otp;

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOrderImplCopyWith<_$VerifyOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetRescheduleStatusImplCopyWith<$Res> {
  factory _$$ResetRescheduleStatusImplCopyWith(
    _$ResetRescheduleStatusImpl value,
    $Res Function(_$ResetRescheduleStatusImpl) then,
  ) = __$$ResetRescheduleStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetRescheduleStatusImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ResetRescheduleStatusImpl>
    implements _$$ResetRescheduleStatusImplCopyWith<$Res> {
  __$$ResetRescheduleStatusImplCopyWithImpl(
    _$ResetRescheduleStatusImpl _value,
    $Res Function(_$ResetRescheduleStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetRescheduleStatusImpl implements ResetRescheduleStatus {
  const _$ResetRescheduleStatusImpl();

  @override
  String toString() {
    return 'OrdersEvent.resetRescheduleStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetRescheduleStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return resetRescheduleStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return resetRescheduleStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetRescheduleStatus != null) {
      return resetRescheduleStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return resetRescheduleStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return resetRescheduleStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetRescheduleStatus != null) {
      return resetRescheduleStatus(this);
    }
    return orElse();
  }
}

abstract class ResetRescheduleStatus implements OrdersEvent {
  const factory ResetRescheduleStatus() = _$ResetRescheduleStatusImpl;
}

/// @nodoc
abstract class _$$ResetCancelStatusImplCopyWith<$Res> {
  factory _$$ResetCancelStatusImplCopyWith(
    _$ResetCancelStatusImpl value,
    $Res Function(_$ResetCancelStatusImpl) then,
  ) = __$$ResetCancelStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCancelStatusImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ResetCancelStatusImpl>
    implements _$$ResetCancelStatusImplCopyWith<$Res> {
  __$$ResetCancelStatusImplCopyWithImpl(
    _$ResetCancelStatusImpl _value,
    $Res Function(_$ResetCancelStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetCancelStatusImpl implements ResetCancelStatus {
  const _$ResetCancelStatusImpl();

  @override
  String toString() {
    return 'OrdersEvent.resetCancelStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetCancelStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return resetCancelStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return resetCancelStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetCancelStatus != null) {
      return resetCancelStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return resetCancelStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return resetCancelStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetCancelStatus != null) {
      return resetCancelStatus(this);
    }
    return orElse();
  }
}

abstract class ResetCancelStatus implements OrdersEvent {
  const factory ResetCancelStatus() = _$ResetCancelStatusImpl;
}

/// @nodoc
abstract class _$$ResetVerifyStatusImplCopyWith<$Res> {
  factory _$$ResetVerifyStatusImplCopyWith(
    _$ResetVerifyStatusImpl value,
    $Res Function(_$ResetVerifyStatusImpl) then,
  ) = __$$ResetVerifyStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetVerifyStatusImplCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$ResetVerifyStatusImpl>
    implements _$$ResetVerifyStatusImplCopyWith<$Res> {
  __$$ResetVerifyStatusImplCopyWithImpl(
    _$ResetVerifyStatusImpl _value,
    $Res Function(_$ResetVerifyStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrdersEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetVerifyStatusImpl implements ResetVerifyStatus {
  const _$ResetVerifyStatusImpl();

  @override
  String toString() {
    return 'OrdersEvent.resetVerifyStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetVerifyStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? lastScheduledId, int? lastOtherId) getOrders,
    required TResult Function(
      int orderId,
      String scheduledDate,
      String scheduledTime,
    )
    rescheduleOrder,
    required TResult Function(int orderId, String cancellationReason)
    cancelOrder,
    required TResult Function(int orderId, int otp) verifyOrder,
    required TResult Function() resetRescheduleStatus,
    required TResult Function() resetCancelStatus,
    required TResult Function() resetVerifyStatus,
  }) {
    return resetVerifyStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult? Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult? Function(int orderId, String cancellationReason)? cancelOrder,
    TResult? Function(int orderId, int otp)? verifyOrder,
    TResult? Function()? resetRescheduleStatus,
    TResult? Function()? resetCancelStatus,
    TResult? Function()? resetVerifyStatus,
  }) {
    return resetVerifyStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? lastScheduledId, int? lastOtherId)? getOrders,
    TResult Function(int orderId, String scheduledDate, String scheduledTime)?
    rescheduleOrder,
    TResult Function(int orderId, String cancellationReason)? cancelOrder,
    TResult Function(int orderId, int otp)? verifyOrder,
    TResult Function()? resetRescheduleStatus,
    TResult Function()? resetCancelStatus,
    TResult Function()? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetVerifyStatus != null) {
      return resetVerifyStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetOrders value) getOrders,
    required TResult Function(RescheduleOrder value) rescheduleOrder,
    required TResult Function(CancelOrder value) cancelOrder,
    required TResult Function(VerifyOrder value) verifyOrder,
    required TResult Function(ResetRescheduleStatus value)
    resetRescheduleStatus,
    required TResult Function(ResetCancelStatus value) resetCancelStatus,
    required TResult Function(ResetVerifyStatus value) resetVerifyStatus,
  }) {
    return resetVerifyStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetOrders value)? getOrders,
    TResult? Function(RescheduleOrder value)? rescheduleOrder,
    TResult? Function(CancelOrder value)? cancelOrder,
    TResult? Function(VerifyOrder value)? verifyOrder,
    TResult? Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult? Function(ResetCancelStatus value)? resetCancelStatus,
    TResult? Function(ResetVerifyStatus value)? resetVerifyStatus,
  }) {
    return resetVerifyStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetOrders value)? getOrders,
    TResult Function(RescheduleOrder value)? rescheduleOrder,
    TResult Function(CancelOrder value)? cancelOrder,
    TResult Function(VerifyOrder value)? verifyOrder,
    TResult Function(ResetRescheduleStatus value)? resetRescheduleStatus,
    TResult Function(ResetCancelStatus value)? resetCancelStatus,
    TResult Function(ResetVerifyStatus value)? resetVerifyStatus,
    required TResult orElse(),
  }) {
    if (resetVerifyStatus != null) {
      return resetVerifyStatus(this);
    }
    return orElse();
  }
}

abstract class ResetVerifyStatus implements OrdersEvent {
  const factory ResetVerifyStatus() = _$ResetVerifyStatusImpl;
}

/// @nodoc
mixin _$OrdersState {
  ApiStatus get getOrdersStatus => throw _privateConstructorUsedError;
  ApiStatus get rescheduleStatus => throw _privateConstructorUsedError;
  ApiStatus get cancelStatus => throw _privateConstructorUsedError;
  ApiStatus get verifyStatus => throw _privateConstructorUsedError;
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
    ApiStatus rescheduleStatus,
    ApiStatus cancelStatus,
    ApiStatus verifyStatus,
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
    Object? rescheduleStatus = null,
    Object? cancelStatus = null,
    Object? verifyStatus = null,
    Object? ordersResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            getOrdersStatus: null == getOrdersStatus
                ? _value.getOrdersStatus
                : getOrdersStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            rescheduleStatus: null == rescheduleStatus
                ? _value.rescheduleStatus
                : rescheduleStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            cancelStatus: null == cancelStatus
                ? _value.cancelStatus
                : cancelStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            verifyStatus: null == verifyStatus
                ? _value.verifyStatus
                : verifyStatus // ignore: cast_nullable_to_non_nullable
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
    ApiStatus rescheduleStatus,
    ApiStatus cancelStatus,
    ApiStatus verifyStatus,
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
    Object? rescheduleStatus = null,
    Object? cancelStatus = null,
    Object? verifyStatus = null,
    Object? ordersResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$OrdersStateImpl(
        getOrdersStatus: null == getOrdersStatus
            ? _value.getOrdersStatus
            : getOrdersStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        rescheduleStatus: null == rescheduleStatus
            ? _value.rescheduleStatus
            : rescheduleStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        cancelStatus: null == cancelStatus
            ? _value.cancelStatus
            : cancelStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        verifyStatus: null == verifyStatus
            ? _value.verifyStatus
            : verifyStatus // ignore: cast_nullable_to_non_nullable
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
    required this.rescheduleStatus,
    required this.cancelStatus,
    required this.verifyStatus,
    this.ordersResponse,
    this.errorMessage,
  });

  @override
  final ApiStatus getOrdersStatus;
  @override
  final ApiStatus rescheduleStatus;
  @override
  final ApiStatus cancelStatus;
  @override
  final ApiStatus verifyStatus;
  @override
  final OrdersResponse? ordersResponse;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'OrdersState(getOrdersStatus: $getOrdersStatus, rescheduleStatus: $rescheduleStatus, cancelStatus: $cancelStatus, verifyStatus: $verifyStatus, ordersResponse: $ordersResponse, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrdersStateImpl &&
            (identical(other.getOrdersStatus, getOrdersStatus) ||
                other.getOrdersStatus == getOrdersStatus) &&
            (identical(other.rescheduleStatus, rescheduleStatus) ||
                other.rescheduleStatus == rescheduleStatus) &&
            (identical(other.cancelStatus, cancelStatus) ||
                other.cancelStatus == cancelStatus) &&
            (identical(other.verifyStatus, verifyStatus) ||
                other.verifyStatus == verifyStatus) &&
            (identical(other.ordersResponse, ordersResponse) ||
                other.ordersResponse == ordersResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    getOrdersStatus,
    rescheduleStatus,
    cancelStatus,
    verifyStatus,
    ordersResponse,
    errorMessage,
  );

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
    required final ApiStatus rescheduleStatus,
    required final ApiStatus cancelStatus,
    required final ApiStatus verifyStatus,
    final OrdersResponse? ordersResponse,
    final String? errorMessage,
  }) = _$OrdersStateImpl;

  @override
  ApiStatus get getOrdersStatus;
  @override
  ApiStatus get rescheduleStatus;
  @override
  ApiStatus get cancelStatus;
  @override
  ApiStatus get verifyStatus;
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
