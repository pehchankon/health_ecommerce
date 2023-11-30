// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingCartModel {
  int get id => throw _privateConstructorUsedError;
  List<PackageModel> get packages => throw _privateConstructorUsedError;
  Set<int> get packagesAdded => throw _privateConstructorUsedError;
  DateTime? get bookingDateTime => throw _privateConstructorUsedError;
  bool get hasHardCopy => throw _privateConstructorUsedError;
  num get totalCost => throw _privateConstructorUsedError;
  num get totalDiscountedCost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingCartModelCopyWith<ShoppingCartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartModelCopyWith<$Res> {
  factory $ShoppingCartModelCopyWith(
          ShoppingCartModel value, $Res Function(ShoppingCartModel) then) =
      _$ShoppingCartModelCopyWithImpl<$Res, ShoppingCartModel>;
  @useResult
  $Res call(
      {int id,
      List<PackageModel> packages,
      Set<int> packagesAdded,
      DateTime? bookingDateTime,
      bool hasHardCopy,
      num totalCost,
      num totalDiscountedCost});
}

/// @nodoc
class _$ShoppingCartModelCopyWithImpl<$Res, $Val extends ShoppingCartModel>
    implements $ShoppingCartModelCopyWith<$Res> {
  _$ShoppingCartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? packages = null,
    Object? packagesAdded = null,
    Object? bookingDateTime = freezed,
    Object? hasHardCopy = null,
    Object? totalCost = null,
    Object? totalDiscountedCost = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
      packagesAdded: null == packagesAdded
          ? _value.packagesAdded
          : packagesAdded // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      bookingDateTime: freezed == bookingDateTime
          ? _value.bookingDateTime
          : bookingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasHardCopy: null == hasHardCopy
          ? _value.hasHardCopy
          : hasHardCopy // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountedCost: null == totalDiscountedCost
          ? _value.totalDiscountedCost
          : totalDiscountedCost // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingCartModelImplCopyWith<$Res>
    implements $ShoppingCartModelCopyWith<$Res> {
  factory _$$ShoppingCartModelImplCopyWith(_$ShoppingCartModelImpl value,
          $Res Function(_$ShoppingCartModelImpl) then) =
      __$$ShoppingCartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<PackageModel> packages,
      Set<int> packagesAdded,
      DateTime? bookingDateTime,
      bool hasHardCopy,
      num totalCost,
      num totalDiscountedCost});
}

/// @nodoc
class __$$ShoppingCartModelImplCopyWithImpl<$Res>
    extends _$ShoppingCartModelCopyWithImpl<$Res, _$ShoppingCartModelImpl>
    implements _$$ShoppingCartModelImplCopyWith<$Res> {
  __$$ShoppingCartModelImplCopyWithImpl(_$ShoppingCartModelImpl _value,
      $Res Function(_$ShoppingCartModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? packages = null,
    Object? packagesAdded = null,
    Object? bookingDateTime = freezed,
    Object? hasHardCopy = null,
    Object? totalCost = null,
    Object? totalDiscountedCost = null,
  }) {
    return _then(_$ShoppingCartModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>,
      packagesAdded: null == packagesAdded
          ? _value._packagesAdded
          : packagesAdded // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      bookingDateTime: freezed == bookingDateTime
          ? _value.bookingDateTime
          : bookingDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      hasHardCopy: null == hasHardCopy
          ? _value.hasHardCopy
          : hasHardCopy // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountedCost: null == totalDiscountedCost
          ? _value.totalDiscountedCost
          : totalDiscountedCost // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$ShoppingCartModelImpl implements _ShoppingCartModel {
  _$ShoppingCartModelImpl(
      {required this.id,
      required final List<PackageModel> packages,
      final Set<int> packagesAdded = const {},
      this.bookingDateTime,
      required this.hasHardCopy,
      required this.totalCost,
      required this.totalDiscountedCost})
      : _packages = packages,
        _packagesAdded = packagesAdded;

  @override
  final int id;
  final List<PackageModel> _packages;
  @override
  List<PackageModel> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

  final Set<int> _packagesAdded;
  @override
  @JsonKey()
  Set<int> get packagesAdded {
    if (_packagesAdded is EqualUnmodifiableSetView) return _packagesAdded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_packagesAdded);
  }

  @override
  final DateTime? bookingDateTime;
  @override
  final bool hasHardCopy;
  @override
  final num totalCost;
  @override
  final num totalDiscountedCost;

  @override
  String toString() {
    return 'ShoppingCartModel(id: $id, packages: $packages, packagesAdded: $packagesAdded, bookingDateTime: $bookingDateTime, hasHardCopy: $hasHardCopy, totalCost: $totalCost, totalDiscountedCost: $totalDiscountedCost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            const DeepCollectionEquality()
                .equals(other._packagesAdded, _packagesAdded) &&
            (identical(other.bookingDateTime, bookingDateTime) ||
                other.bookingDateTime == bookingDateTime) &&
            (identical(other.hasHardCopy, hasHardCopy) ||
                other.hasHardCopy == hasHardCopy) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalDiscountedCost, totalDiscountedCost) ||
                other.totalDiscountedCost == totalDiscountedCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_packages),
      const DeepCollectionEquality().hash(_packagesAdded),
      bookingDateTime,
      hasHardCopy,
      totalCost,
      totalDiscountedCost);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCartModelImplCopyWith<_$ShoppingCartModelImpl> get copyWith =>
      __$$ShoppingCartModelImplCopyWithImpl<_$ShoppingCartModelImpl>(
          this, _$identity);
}

abstract class _ShoppingCartModel implements ShoppingCartModel {
  factory _ShoppingCartModel(
      {required final int id,
      required final List<PackageModel> packages,
      final Set<int> packagesAdded,
      final DateTime? bookingDateTime,
      required final bool hasHardCopy,
      required final num totalCost,
      required final num totalDiscountedCost}) = _$ShoppingCartModelImpl;

  @override
  int get id;
  @override
  List<PackageModel> get packages;
  @override
  Set<int> get packagesAdded;
  @override
  DateTime? get bookingDateTime;
  @override
  bool get hasHardCopy;
  @override
  num get totalCost;
  @override
  num get totalDiscountedCost;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingCartModelImplCopyWith<_$ShoppingCartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
