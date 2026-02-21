// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
    _$SendOtpImpl value,
    $Res Function(_$SendOtpImpl) then,
  ) = __$$SendOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobile});
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
    _$SendOtpImpl _value,
    $Res Function(_$SendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobile = null}) {
    return _then(
      _$SendOtpImpl(
        mobile: null == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SendOtpImpl implements SendOtp {
  const _$SendOtpImpl({required this.mobile});

  @override
  final String mobile;

  @override
  String toString() {
    return 'AuthEvent.sendOtp(mobile: $mobile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendOtpImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobile);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      __$$SendOtpImplCopyWithImpl<_$SendOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return sendOtp(mobile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return sendOtp?.call(mobile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(mobile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements AuthEvent {
  const factory SendOtp({required final String mobile}) = _$SendOtpImpl;

  String get mobile;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendOtpImplCopyWith<_$SendOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
    _$VerifyOtpImpl value,
    $Res Function(_$VerifyOtpImpl) then,
  ) = __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String mobile, String otp});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
    _$VerifyOtpImpl _value,
    $Res Function(_$VerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? mobile = null, Object? otp = null}) {
    return _then(
      _$VerifyOtpImpl(
        mobile: null == mobile
            ? _value.mobile
            : mobile // ignore: cast_nullable_to_non_nullable
                  as String,
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl({required this.mobile, required this.otp});

  @override
  final String mobile;
  @override
  final String otp;

  @override
  String toString() {
    return 'AuthEvent.verifyOtp(mobile: $mobile, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobile, otp);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return verifyOtp(mobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return verifyOtp?.call(mobile, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(mobile, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements AuthEvent {
  const factory VerifyOtp({
    required final String mobile,
    required final String otp,
  }) = _$VerifyOtpImpl;

  String get mobile;
  String get otp;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetSendOtpImplCopyWith<$Res> {
  factory _$$ResetSendOtpImplCopyWith(
    _$ResetSendOtpImpl value,
    $Res Function(_$ResetSendOtpImpl) then,
  ) = __$$ResetSendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetSendOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetSendOtpImpl>
    implements _$$ResetSendOtpImplCopyWith<$Res> {
  __$$ResetSendOtpImplCopyWithImpl(
    _$ResetSendOtpImpl _value,
    $Res Function(_$ResetSendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetSendOtpImpl implements ResetSendOtp {
  const _$ResetSendOtpImpl();

  @override
  String toString() {
    return 'AuthEvent.resetSendOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetSendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return resetSendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return resetSendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetSendOtp != null) {
      return resetSendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return resetSendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return resetSendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetSendOtp != null) {
      return resetSendOtp(this);
    }
    return orElse();
  }
}

abstract class ResetSendOtp implements AuthEvent {
  const factory ResetSendOtp() = _$ResetSendOtpImpl;
}

/// @nodoc
abstract class _$$ResetVerifyOtpImplCopyWith<$Res> {
  factory _$$ResetVerifyOtpImplCopyWith(
    _$ResetVerifyOtpImpl value,
    $Res Function(_$ResetVerifyOtpImpl) then,
  ) = __$$ResetVerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetVerifyOtpImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetVerifyOtpImpl>
    implements _$$ResetVerifyOtpImplCopyWith<$Res> {
  __$$ResetVerifyOtpImplCopyWithImpl(
    _$ResetVerifyOtpImpl _value,
    $Res Function(_$ResetVerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetVerifyOtpImpl implements ResetVerifyOtp {
  const _$ResetVerifyOtpImpl();

  @override
  String toString() {
    return 'AuthEvent.resetVerifyOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetVerifyOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return resetVerifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return resetVerifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetVerifyOtp != null) {
      return resetVerifyOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return resetVerifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return resetVerifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetVerifyOtp != null) {
      return resetVerifyOtp(this);
    }
    return orElse();
  }
}

abstract class ResetVerifyOtp implements AuthEvent {
  const factory ResetVerifyOtp() = _$ResetVerifyOtpImpl;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
    _$RegisterImpl value,
    $Res Function(_$RegisterImpl) then,
  ) = __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String email,
    int? age,
    String? gender,
    File? profileImage,
  });
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
    _$RegisterImpl _value,
    $Res Function(_$RegisterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(
      _$RegisterImpl(
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImage: freezed == profileImage
            ? _value.profileImage
            : profileImage // ignore: cast_nullable_to_non_nullable
                  as File?,
      ),
    );
  }
}

/// @nodoc

class _$RegisterImpl implements Register {
  const _$RegisterImpl({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.age,
    this.gender,
    this.profileImage,
  });

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final File? profileImage;

  @override
  String toString() {
    return 'AuthEvent.register(firstName: $firstName, lastName: $lastName, email: $email, age: $age, gender: $gender, profileImage: $profileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    firstName,
    lastName,
    email,
    age,
    gender,
    profileImage,
  );

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return register(firstName, lastName, email, age, gender, profileImage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return register?.call(
      firstName,
      lastName,
      email,
      age,
      gender,
      profileImage,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(firstName, lastName, email, age, gender, profileImage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class Register implements AuthEvent {
  const factory Register({
    required final String firstName,
    required final String lastName,
    required final String email,
    final int? age,
    final String? gender,
    final File? profileImage,
  }) = _$RegisterImpl;

  String get firstName;
  String get lastName;
  String get email;
  int? get age;
  String? get gender;
  File? get profileImage;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetRegisterStatusImplCopyWith<$Res> {
  factory _$$ResetRegisterStatusImplCopyWith(
    _$ResetRegisterStatusImpl value,
    $Res Function(_$ResetRegisterStatusImpl) then,
  ) = __$$ResetRegisterStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetRegisterStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetRegisterStatusImpl>
    implements _$$ResetRegisterStatusImplCopyWith<$Res> {
  __$$ResetRegisterStatusImplCopyWithImpl(
    _$ResetRegisterStatusImpl _value,
    $Res Function(_$ResetRegisterStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetRegisterStatusImpl implements ResetRegisterStatus {
  const _$ResetRegisterStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.resetRegisterStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetRegisterStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobile) sendOtp,
    required TResult Function(String mobile, String otp) verifyOtp,
    required TResult Function() resetSendOtp,
    required TResult Function() resetVerifyOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )
    register,
    required TResult Function() resetRegisterStatus,
  }) {
    return resetRegisterStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String mobile)? sendOtp,
    TResult? Function(String mobile, String otp)? verifyOtp,
    TResult? Function()? resetSendOtp,
    TResult? Function()? resetVerifyOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult? Function()? resetRegisterStatus,
  }) {
    return resetRegisterStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobile)? sendOtp,
    TResult Function(String mobile, String otp)? verifyOtp,
    TResult Function()? resetSendOtp,
    TResult Function()? resetVerifyOtp,
    TResult Function(
      String firstName,
      String lastName,
      String email,
      int? age,
      String? gender,
      File? profileImage,
    )?
    register,
    TResult Function()? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetRegisterStatus != null) {
      return resetRegisterStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
    required TResult Function(VerifyOtp value) verifyOtp,
    required TResult Function(ResetSendOtp value) resetSendOtp,
    required TResult Function(ResetVerifyOtp value) resetVerifyOtp,
    required TResult Function(Register value) register,
    required TResult Function(ResetRegisterStatus value) resetRegisterStatus,
  }) {
    return resetRegisterStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
    TResult? Function(VerifyOtp value)? verifyOtp,
    TResult? Function(ResetSendOtp value)? resetSendOtp,
    TResult? Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult? Function(Register value)? register,
    TResult? Function(ResetRegisterStatus value)? resetRegisterStatus,
  }) {
    return resetRegisterStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    TResult Function(VerifyOtp value)? verifyOtp,
    TResult Function(ResetSendOtp value)? resetSendOtp,
    TResult Function(ResetVerifyOtp value)? resetVerifyOtp,
    TResult Function(Register value)? register,
    TResult Function(ResetRegisterStatus value)? resetRegisterStatus,
    required TResult orElse(),
  }) {
    if (resetRegisterStatus != null) {
      return resetRegisterStatus(this);
    }
    return orElse();
  }
}

abstract class ResetRegisterStatus implements AuthEvent {
  const factory ResetRegisterStatus() = _$ResetRegisterStatusImpl;
}

/// @nodoc
mixin _$AuthState {
  ApiStatus get sendOtpStatus => throw _privateConstructorUsedError;
  ApiStatus get verifyOtpStatus => throw _privateConstructorUsedError;
  ApiStatus get registrationStatus => throw _privateConstructorUsedError;
  OTPResponse? get otpResponse => throw _privateConstructorUsedError;
  VerifyResponse? get verifyResponse => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({
    ApiStatus sendOtpStatus,
    ApiStatus verifyOtpStatus,
    ApiStatus registrationStatus,
    OTPResponse? otpResponse,
    VerifyResponse? verifyResponse,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendOtpStatus = null,
    Object? verifyOtpStatus = null,
    Object? registrationStatus = null,
    Object? otpResponse = freezed,
    Object? verifyResponse = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            sendOtpStatus: null == sendOtpStatus
                ? _value.sendOtpStatus
                : sendOtpStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            verifyOtpStatus: null == verifyOtpStatus
                ? _value.verifyOtpStatus
                : verifyOtpStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            registrationStatus: null == registrationStatus
                ? _value.registrationStatus
                : registrationStatus // ignore: cast_nullable_to_non_nullable
                      as ApiStatus,
            otpResponse: freezed == otpResponse
                ? _value.otpResponse
                : otpResponse // ignore: cast_nullable_to_non_nullable
                      as OTPResponse?,
            verifyResponse: freezed == verifyResponse
                ? _value.verifyResponse
                : verifyResponse // ignore: cast_nullable_to_non_nullable
                      as VerifyResponse?,
            successMessage: freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
    _$AuthStateImpl value,
    $Res Function(_$AuthStateImpl) then,
  ) = __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ApiStatus sendOtpStatus,
    ApiStatus verifyOtpStatus,
    ApiStatus registrationStatus,
    OTPResponse? otpResponse,
    VerifyResponse? verifyResponse,
    String? successMessage,
    String? errorMessage,
  });
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
    _$AuthStateImpl _value,
    $Res Function(_$AuthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendOtpStatus = null,
    Object? verifyOtpStatus = null,
    Object? registrationStatus = null,
    Object? otpResponse = freezed,
    Object? verifyResponse = freezed,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$AuthStateImpl(
        sendOtpStatus: null == sendOtpStatus
            ? _value.sendOtpStatus
            : sendOtpStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        verifyOtpStatus: null == verifyOtpStatus
            ? _value.verifyOtpStatus
            : verifyOtpStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        registrationStatus: null == registrationStatus
            ? _value.registrationStatus
            : registrationStatus // ignore: cast_nullable_to_non_nullable
                  as ApiStatus,
        otpResponse: freezed == otpResponse
            ? _value.otpResponse
            : otpResponse // ignore: cast_nullable_to_non_nullable
                  as OTPResponse?,
        verifyResponse: freezed == verifyResponse
            ? _value.verifyResponse
            : verifyResponse // ignore: cast_nullable_to_non_nullable
                  as VerifyResponse?,
        successMessage: freezed == successMessage
            ? _value.successMessage
            : successMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl({
    required this.sendOtpStatus,
    required this.verifyOtpStatus,
    required this.registrationStatus,
    this.otpResponse,
    this.verifyResponse,
    this.successMessage,
    this.errorMessage,
  });

  @override
  final ApiStatus sendOtpStatus;
  @override
  final ApiStatus verifyOtpStatus;
  @override
  final ApiStatus registrationStatus;
  @override
  final OTPResponse? otpResponse;
  @override
  final VerifyResponse? verifyResponse;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthState(sendOtpStatus: $sendOtpStatus, verifyOtpStatus: $verifyOtpStatus, registrationStatus: $registrationStatus, otpResponse: $otpResponse, verifyResponse: $verifyResponse, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.sendOtpStatus, sendOtpStatus) ||
                other.sendOtpStatus == sendOtpStatus) &&
            (identical(other.verifyOtpStatus, verifyOtpStatus) ||
                other.verifyOtpStatus == verifyOtpStatus) &&
            (identical(other.registrationStatus, registrationStatus) ||
                other.registrationStatus == registrationStatus) &&
            (identical(other.otpResponse, otpResponse) ||
                other.otpResponse == otpResponse) &&
            (identical(other.verifyResponse, verifyResponse) ||
                other.verifyResponse == verifyResponse) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sendOtpStatus,
    verifyOtpStatus,
    registrationStatus,
    otpResponse,
    verifyResponse,
    successMessage,
    errorMessage,
  );

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState({
    required final ApiStatus sendOtpStatus,
    required final ApiStatus verifyOtpStatus,
    required final ApiStatus registrationStatus,
    final OTPResponse? otpResponse,
    final VerifyResponse? verifyResponse,
    final String? successMessage,
    final String? errorMessage,
  }) = _$AuthStateImpl;

  @override
  ApiStatus get sendOtpStatus;
  @override
  ApiStatus get verifyOtpStatus;
  @override
  ApiStatus get registrationStatus;
  @override
  OTPResponse? get otpResponse;
  @override
  VerifyResponse? get verifyResponse;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
