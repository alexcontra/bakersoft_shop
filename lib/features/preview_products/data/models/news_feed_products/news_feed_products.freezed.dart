// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_feed_products.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsFeedModel _$NewsFeedModelFromJson(Map<String, dynamic> json) {
  return _NewsFeedProducts.fromJson(json);
}

/// @nodoc
mixin _$NewsFeedModel {
  ProductModel? get topProduct => throw _privateConstructorUsedError;
  List<ProductModel>? get productContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsFeedModelCopyWith<NewsFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFeedModelCopyWith<$Res> {
  factory $NewsFeedModelCopyWith(
          NewsFeedModel value, $Res Function(NewsFeedModel) then) =
      _$NewsFeedModelCopyWithImpl<$Res, NewsFeedModel>;
  @useResult
  $Res call({ProductModel? topProduct, List<ProductModel>? productContent});

  $ProductModelCopyWith<$Res>? get topProduct;
}

/// @nodoc
class _$NewsFeedModelCopyWithImpl<$Res, $Val extends NewsFeedModel>
    implements $NewsFeedModelCopyWith<$Res> {
  _$NewsFeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topProduct = freezed,
    Object? productContent = freezed,
  }) {
    return _then(_value.copyWith(
      topProduct: freezed == topProduct
          ? _value.topProduct
          : topProduct // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      productContent: freezed == productContent
          ? _value.productContent
          : productContent // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get topProduct {
    if (_value.topProduct == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.topProduct!, (value) {
      return _then(_value.copyWith(topProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NewsFeedProductsCopyWith<$Res>
    implements $NewsFeedModelCopyWith<$Res> {
  factory _$$_NewsFeedProductsCopyWith(
          _$_NewsFeedProducts value, $Res Function(_$_NewsFeedProducts) then) =
      __$$_NewsFeedProductsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductModel? topProduct, List<ProductModel>? productContent});

  @override
  $ProductModelCopyWith<$Res>? get topProduct;
}

/// @nodoc
class __$$_NewsFeedProductsCopyWithImpl<$Res>
    extends _$NewsFeedModelCopyWithImpl<$Res, _$_NewsFeedProducts>
    implements _$$_NewsFeedProductsCopyWith<$Res> {
  __$$_NewsFeedProductsCopyWithImpl(
      _$_NewsFeedProducts _value, $Res Function(_$_NewsFeedProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topProduct = freezed,
    Object? productContent = freezed,
  }) {
    return _then(_$_NewsFeedProducts(
      topProduct: freezed == topProduct
          ? _value.topProduct
          : topProduct // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      productContent: freezed == productContent
          ? _value._productContent
          : productContent // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsFeedProducts implements _NewsFeedProducts {
  _$_NewsFeedProducts(
      {this.topProduct, final List<ProductModel>? productContent})
      : _productContent = productContent;

  factory _$_NewsFeedProducts.fromJson(Map<String, dynamic> json) =>
      _$$_NewsFeedProductsFromJson(json);

  @override
  final ProductModel? topProduct;
  final List<ProductModel>? _productContent;
  @override
  List<ProductModel>? get productContent {
    final value = _productContent;
    if (value == null) return null;
    if (_productContent is EqualUnmodifiableListView) return _productContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NewsFeedModel(topProduct: $topProduct, productContent: $productContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewsFeedProducts &&
            (identical(other.topProduct, topProduct) ||
                other.topProduct == topProduct) &&
            const DeepCollectionEquality()
                .equals(other._productContent, _productContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topProduct,
      const DeepCollectionEquality().hash(_productContent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewsFeedProductsCopyWith<_$_NewsFeedProducts> get copyWith =>
      __$$_NewsFeedProductsCopyWithImpl<_$_NewsFeedProducts>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsFeedProductsToJson(
      this,
    );
  }
}

abstract class _NewsFeedProducts implements NewsFeedModel {
  factory _NewsFeedProducts(
      {final ProductModel? topProduct,
      final List<ProductModel>? productContent}) = _$_NewsFeedProducts;

  factory _NewsFeedProducts.fromJson(Map<String, dynamic> json) =
      _$_NewsFeedProducts.fromJson;

  @override
  ProductModel? get topProduct;
  @override
  List<ProductModel>? get productContent;
  @override
  @JsonKey(ignore: true)
  _$$_NewsFeedProductsCopyWith<_$_NewsFeedProducts> get copyWith =>
      throw _privateConstructorUsedError;
}
