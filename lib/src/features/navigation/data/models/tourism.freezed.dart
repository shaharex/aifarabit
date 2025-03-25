// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tourism.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TourismData _$TourismDataFromJson(Map<String, dynamic> json) {
  return _TourismData.fromJson(json);
}

/// @nodoc
mixin _$TourismData {
  String get city => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get lattitude => throw _privateConstructorUsedError;
  List<Hotel> get hotels => throw _privateConstructorUsedError;
  Emergency get emergency => throw _privateConstructorUsedError;
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;
  Attractions get attractions => throw _privateConstructorUsedError;
  Services get services => throw _privateConstructorUsedError;

  /// Serializes this TourismData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourismDataCopyWith<TourismData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourismDataCopyWith<$Res> {
  factory $TourismDataCopyWith(
          TourismData value, $Res Function(TourismData) then) =
      _$TourismDataCopyWithImpl<$Res, TourismData>;
  @useResult
  $Res call(
      {String city,
      double? longitude,
      double? lattitude,
      List<Hotel> hotels,
      Emergency emergency,
      List<Restaurant> restaurants,
      Attractions attractions,
      Services services});

  $EmergencyCopyWith<$Res> get emergency;
  $AttractionsCopyWith<$Res> get attractions;
  $ServicesCopyWith<$Res> get services;
}

/// @nodoc
class _$TourismDataCopyWithImpl<$Res, $Val extends TourismData>
    implements $TourismDataCopyWith<$Res> {
  _$TourismDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? longitude = freezed,
    Object? lattitude = freezed,
    Object? hotels = null,
    Object? emergency = null,
    Object? restaurants = null,
    Object? attractions = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lattitude: freezed == lattitude
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double?,
      hotels: null == hotels
          ? _value.hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      emergency: null == emergency
          ? _value.emergency
          : emergency // ignore: cast_nullable_to_non_nullable
              as Emergency,
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      attractions: null == attractions
          ? _value.attractions
          : attractions // ignore: cast_nullable_to_non_nullable
              as Attractions,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Services,
    ) as $Val);
  }

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmergencyCopyWith<$Res> get emergency {
    return $EmergencyCopyWith<$Res>(_value.emergency, (value) {
      return _then(_value.copyWith(emergency: value) as $Val);
    });
  }

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttractionsCopyWith<$Res> get attractions {
    return $AttractionsCopyWith<$Res>(_value.attractions, (value) {
      return _then(_value.copyWith(attractions: value) as $Val);
    });
  }

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServicesCopyWith<$Res> get services {
    return $ServicesCopyWith<$Res>(_value.services, (value) {
      return _then(_value.copyWith(services: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TourismDataImplCopyWith<$Res>
    implements $TourismDataCopyWith<$Res> {
  factory _$$TourismDataImplCopyWith(
          _$TourismDataImpl value, $Res Function(_$TourismDataImpl) then) =
      __$$TourismDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String city,
      double? longitude,
      double? lattitude,
      List<Hotel> hotels,
      Emergency emergency,
      List<Restaurant> restaurants,
      Attractions attractions,
      Services services});

  @override
  $EmergencyCopyWith<$Res> get emergency;
  @override
  $AttractionsCopyWith<$Res> get attractions;
  @override
  $ServicesCopyWith<$Res> get services;
}

/// @nodoc
class __$$TourismDataImplCopyWithImpl<$Res>
    extends _$TourismDataCopyWithImpl<$Res, _$TourismDataImpl>
    implements _$$TourismDataImplCopyWith<$Res> {
  __$$TourismDataImplCopyWithImpl(
      _$TourismDataImpl _value, $Res Function(_$TourismDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? longitude = freezed,
    Object? lattitude = freezed,
    Object? hotels = null,
    Object? emergency = null,
    Object? restaurants = null,
    Object? attractions = null,
    Object? services = null,
  }) {
    return _then(_$TourismDataImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      lattitude: freezed == lattitude
          ? _value.lattitude
          : lattitude // ignore: cast_nullable_to_non_nullable
              as double?,
      hotels: null == hotels
          ? _value._hotels
          : hotels // ignore: cast_nullable_to_non_nullable
              as List<Hotel>,
      emergency: null == emergency
          ? _value.emergency
          : emergency // ignore: cast_nullable_to_non_nullable
              as Emergency,
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
      attractions: null == attractions
          ? _value.attractions
          : attractions // ignore: cast_nullable_to_non_nullable
              as Attractions,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Services,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourismDataImpl implements _TourismData {
  const _$TourismDataImpl(
      {required this.city,
      this.longitude,
      this.lattitude,
      required final List<Hotel> hotels,
      required this.emergency,
      required final List<Restaurant> restaurants,
      required this.attractions,
      required this.services})
      : _hotels = hotels,
        _restaurants = restaurants;

  factory _$TourismDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourismDataImplFromJson(json);

  @override
  final String city;
  @override
  final double? longitude;
  @override
  final double? lattitude;
  final List<Hotel> _hotels;
  @override
  List<Hotel> get hotels {
    if (_hotels is EqualUnmodifiableListView) return _hotels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hotels);
  }

  @override
  final Emergency emergency;
  final List<Restaurant> _restaurants;
  @override
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  final Attractions attractions;
  @override
  final Services services;

  @override
  String toString() {
    return 'TourismData(city: $city, longitude: $longitude, lattitude: $lattitude, hotels: $hotels, emergency: $emergency, restaurants: $restaurants, attractions: $attractions, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourismDataImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.lattitude, lattitude) ||
                other.lattitude == lattitude) &&
            const DeepCollectionEquality().equals(other._hotels, _hotels) &&
            (identical(other.emergency, emergency) ||
                other.emergency == emergency) &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants) &&
            (identical(other.attractions, attractions) ||
                other.attractions == attractions) &&
            (identical(other.services, services) ||
                other.services == services));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      city,
      longitude,
      lattitude,
      const DeepCollectionEquality().hash(_hotels),
      emergency,
      const DeepCollectionEquality().hash(_restaurants),
      attractions,
      services);

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourismDataImplCopyWith<_$TourismDataImpl> get copyWith =>
      __$$TourismDataImplCopyWithImpl<_$TourismDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourismDataImplToJson(
      this,
    );
  }
}

abstract class _TourismData implements TourismData {
  const factory _TourismData(
      {required final String city,
      final double? longitude,
      final double? lattitude,
      required final List<Hotel> hotels,
      required final Emergency emergency,
      required final List<Restaurant> restaurants,
      required final Attractions attractions,
      required final Services services}) = _$TourismDataImpl;

  factory _TourismData.fromJson(Map<String, dynamic> json) =
      _$TourismDataImpl.fromJson;

  @override
  String get city;
  @override
  double? get longitude;
  @override
  double? get lattitude;
  @override
  List<Hotel> get hotels;
  @override
  Emergency get emergency;
  @override
  List<Restaurant> get restaurants;
  @override
  Attractions get attractions;
  @override
  Services get services;

  /// Create a copy of TourismData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourismDataImplCopyWith<_$TourismDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hotel _$HotelFromJson(Map<String, dynamic> json) {
  return _Hotel.fromJson(json);
}

/// @nodoc
mixin _$Hotel {
  String get name => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HotelCopyWith<Hotel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HotelCopyWith<$Res> {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) then) =
      _$HotelCopyWithImpl<$Res, Hotel>;
  @useResult
  $Res call(
      {String name,
      int? price,
      double? rating,
      String address,
      List<String> images});
}

/// @nodoc
class _$HotelCopyWithImpl<$Res, $Val extends Hotel>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = freezed,
    Object? rating = freezed,
    Object? address = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HotelImplCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$$HotelImplCopyWith(
          _$HotelImpl value, $Res Function(_$HotelImpl) then) =
      __$$HotelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? price,
      double? rating,
      String address,
      List<String> images});
}

/// @nodoc
class __$$HotelImplCopyWithImpl<$Res>
    extends _$HotelCopyWithImpl<$Res, _$HotelImpl>
    implements _$$HotelImplCopyWith<$Res> {
  __$$HotelImplCopyWithImpl(
      _$HotelImpl _value, $Res Function(_$HotelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = freezed,
    Object? rating = freezed,
    Object? address = null,
    Object? images = null,
  }) {
    return _then(_$HotelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HotelImpl implements _Hotel {
  const _$HotelImpl(
      {required this.name,
      this.price,
      this.rating,
      required this.address,
      required final List<String> images})
      : _images = images;

  factory _$HotelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HotelImplFromJson(json);

  @override
  final String name;
  @override
  final int? price;
  @override
  final double? rating;
  @override
  final String address;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'Hotel(name: $name, price: $price, rating: $rating, address: $address, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HotelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, rating, address,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      __$$HotelImplCopyWithImpl<_$HotelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HotelImplToJson(
      this,
    );
  }
}

abstract class _Hotel implements Hotel {
  const factory _Hotel(
      {required final String name,
      final int? price,
      final double? rating,
      required final String address,
      required final List<String> images}) = _$HotelImpl;

  factory _Hotel.fromJson(Map<String, dynamic> json) = _$HotelImpl.fromJson;

  @override
  String get name;
  @override
  int? get price;
  @override
  double? get rating;
  @override
  String get address;
  @override
  List<String> get images;

  /// Create a copy of Hotel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HotelImplCopyWith<_$HotelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Emergency _$EmergencyFromJson(Map<String, dynamic> json) {
  return _Emergency.fromJson(json);
}

/// @nodoc
mixin _$Emergency {
  List<Hospital> get hospitals => throw _privateConstructorUsedError;

  /// Serializes this Emergency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmergencyCopyWith<Emergency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmergencyCopyWith<$Res> {
  factory $EmergencyCopyWith(Emergency value, $Res Function(Emergency) then) =
      _$EmergencyCopyWithImpl<$Res, Emergency>;
  @useResult
  $Res call({List<Hospital> hospitals});
}

/// @nodoc
class _$EmergencyCopyWithImpl<$Res, $Val extends Emergency>
    implements $EmergencyCopyWith<$Res> {
  _$EmergencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
  }) {
    return _then(_value.copyWith(
      hospitals: null == hospitals
          ? _value.hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<Hospital>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmergencyImplCopyWith<$Res>
    implements $EmergencyCopyWith<$Res> {
  factory _$$EmergencyImplCopyWith(
          _$EmergencyImpl value, $Res Function(_$EmergencyImpl) then) =
      __$$EmergencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Hospital> hospitals});
}

/// @nodoc
class __$$EmergencyImplCopyWithImpl<$Res>
    extends _$EmergencyCopyWithImpl<$Res, _$EmergencyImpl>
    implements _$$EmergencyImplCopyWith<$Res> {
  __$$EmergencyImplCopyWithImpl(
      _$EmergencyImpl _value, $Res Function(_$EmergencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hospitals = null,
  }) {
    return _then(_$EmergencyImpl(
      hospitals: null == hospitals
          ? _value._hospitals
          : hospitals // ignore: cast_nullable_to_non_nullable
              as List<Hospital>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmergencyImpl implements _Emergency {
  const _$EmergencyImpl({required final List<Hospital> hospitals})
      : _hospitals = hospitals;

  factory _$EmergencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmergencyImplFromJson(json);

  final List<Hospital> _hospitals;
  @override
  List<Hospital> get hospitals {
    if (_hospitals is EqualUnmodifiableListView) return _hospitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hospitals);
  }

  @override
  String toString() {
    return 'Emergency(hospitals: $hospitals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmergencyImpl &&
            const DeepCollectionEquality()
                .equals(other._hospitals, _hospitals));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hospitals));

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmergencyImplCopyWith<_$EmergencyImpl> get copyWith =>
      __$$EmergencyImplCopyWithImpl<_$EmergencyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmergencyImplToJson(
      this,
    );
  }
}

abstract class _Emergency implements Emergency {
  const factory _Emergency({required final List<Hospital> hospitals}) =
      _$EmergencyImpl;

  factory _Emergency.fromJson(Map<String, dynamic> json) =
      _$EmergencyImpl.fromJson;

  @override
  List<Hospital> get hospitals;

  /// Create a copy of Emergency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmergencyImplCopyWith<_$EmergencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return _Hospital.fromJson(json);
}

/// @nodoc
mixin _$Hospital {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this Hospital to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HospitalCopyWith<Hospital> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HospitalCopyWith<$Res> {
  factory $HospitalCopyWith(Hospital value, $Res Function(Hospital) then) =
      _$HospitalCopyWithImpl<$Res, Hospital>;
  @useResult
  $Res call({String name, String address});
}

/// @nodoc
class _$HospitalCopyWithImpl<$Res, $Val extends Hospital>
    implements $HospitalCopyWith<$Res> {
  _$HospitalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HospitalImplCopyWith<$Res>
    implements $HospitalCopyWith<$Res> {
  factory _$$HospitalImplCopyWith(
          _$HospitalImpl value, $Res Function(_$HospitalImpl) then) =
      __$$HospitalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String address});
}

/// @nodoc
class __$$HospitalImplCopyWithImpl<$Res>
    extends _$HospitalCopyWithImpl<$Res, _$HospitalImpl>
    implements _$$HospitalImplCopyWith<$Res> {
  __$$HospitalImplCopyWithImpl(
      _$HospitalImpl _value, $Res Function(_$HospitalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
  }) {
    return _then(_$HospitalImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HospitalImpl implements _Hospital {
  const _$HospitalImpl({required this.name, required this.address});

  factory _$HospitalImpl.fromJson(Map<String, dynamic> json) =>
      _$$HospitalImplFromJson(json);

  @override
  final String name;
  @override
  final String address;

  @override
  String toString() {
    return 'Hospital(name: $name, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HospitalImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address);

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      __$$HospitalImplCopyWithImpl<_$HospitalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HospitalImplToJson(
      this,
    );
  }
}

abstract class _Hospital implements Hospital {
  const factory _Hospital(
      {required final String name,
      required final String address}) = _$HospitalImpl;

  factory _Hospital.fromJson(Map<String, dynamic> json) =
      _$HospitalImpl.fromJson;

  @override
  String get name;
  @override
  String get address;

  /// Create a copy of Hospital
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HospitalImplCopyWith<_$HospitalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call({String name, String address, String price, String rating});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? price = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String address, String price, String rating});
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? price = null,
    Object? rating = null,
  }) {
    return _then(_$RestaurantImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl(
      {required this.name,
      required this.address,
      required this.price,
      required this.rating});

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  final String price;
  @override
  final String rating;

  @override
  String toString() {
    return 'Restaurant(name: $name, address: $address, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, address, price, rating);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant(
      {required final String name,
      required final String address,
      required final String price,
      required final String rating}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  String get price;
  @override
  String get rating;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attractions _$AttractionsFromJson(Map<String, dynamic> json) {
  return _Attractions.fromJson(json);
}

/// @nodoc
mixin _$Attractions {
  List<Attraction> get historical => throw _privateConstructorUsedError;
  List<Attraction> get nature => throw _privateConstructorUsedError;
  List<Attraction> get sport => throw _privateConstructorUsedError;
  List<Attraction> get entertain => throw _privateConstructorUsedError;

  /// Serializes this Attractions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attractions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttractionsCopyWith<Attractions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionsCopyWith<$Res> {
  factory $AttractionsCopyWith(
          Attractions value, $Res Function(Attractions) then) =
      _$AttractionsCopyWithImpl<$Res, Attractions>;
  @useResult
  $Res call(
      {List<Attraction> historical,
      List<Attraction> nature,
      List<Attraction> sport,
      List<Attraction> entertain});
}

/// @nodoc
class _$AttractionsCopyWithImpl<$Res, $Val extends Attractions>
    implements $AttractionsCopyWith<$Res> {
  _$AttractionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attractions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historical = null,
    Object? nature = null,
    Object? sport = null,
    Object? entertain = null,
  }) {
    return _then(_value.copyWith(
      historical: null == historical
          ? _value.historical
          : historical // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      nature: null == nature
          ? _value.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      sport: null == sport
          ? _value.sport
          : sport // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      entertain: null == entertain
          ? _value.entertain
          : entertain // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionsImplCopyWith<$Res>
    implements $AttractionsCopyWith<$Res> {
  factory _$$AttractionsImplCopyWith(
          _$AttractionsImpl value, $Res Function(_$AttractionsImpl) then) =
      __$$AttractionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Attraction> historical,
      List<Attraction> nature,
      List<Attraction> sport,
      List<Attraction> entertain});
}

/// @nodoc
class __$$AttractionsImplCopyWithImpl<$Res>
    extends _$AttractionsCopyWithImpl<$Res, _$AttractionsImpl>
    implements _$$AttractionsImplCopyWith<$Res> {
  __$$AttractionsImplCopyWithImpl(
      _$AttractionsImpl _value, $Res Function(_$AttractionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attractions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historical = null,
    Object? nature = null,
    Object? sport = null,
    Object? entertain = null,
  }) {
    return _then(_$AttractionsImpl(
      historical: null == historical
          ? _value._historical
          : historical // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      nature: null == nature
          ? _value._nature
          : nature // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      sport: null == sport
          ? _value._sport
          : sport // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
      entertain: null == entertain
          ? _value._entertain
          : entertain // ignore: cast_nullable_to_non_nullable
              as List<Attraction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttractionsImpl implements _Attractions {
  const _$AttractionsImpl(
      {required final List<Attraction> historical,
      required final List<Attraction> nature,
      required final List<Attraction> sport,
      required final List<Attraction> entertain})
      : _historical = historical,
        _nature = nature,
        _sport = sport,
        _entertain = entertain;

  factory _$AttractionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttractionsImplFromJson(json);

  final List<Attraction> _historical;
  @override
  List<Attraction> get historical {
    if (_historical is EqualUnmodifiableListView) return _historical;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historical);
  }

  final List<Attraction> _nature;
  @override
  List<Attraction> get nature {
    if (_nature is EqualUnmodifiableListView) return _nature;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nature);
  }

  final List<Attraction> _sport;
  @override
  List<Attraction> get sport {
    if (_sport is EqualUnmodifiableListView) return _sport;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sport);
  }

  final List<Attraction> _entertain;
  @override
  List<Attraction> get entertain {
    if (_entertain is EqualUnmodifiableListView) return _entertain;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entertain);
  }

  @override
  String toString() {
    return 'Attractions(historical: $historical, nature: $nature, sport: $sport, entertain: $entertain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionsImpl &&
            const DeepCollectionEquality()
                .equals(other._historical, _historical) &&
            const DeepCollectionEquality().equals(other._nature, _nature) &&
            const DeepCollectionEquality().equals(other._sport, _sport) &&
            const DeepCollectionEquality()
                .equals(other._entertain, _entertain));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_historical),
      const DeepCollectionEquality().hash(_nature),
      const DeepCollectionEquality().hash(_sport),
      const DeepCollectionEquality().hash(_entertain));

  /// Create a copy of Attractions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionsImplCopyWith<_$AttractionsImpl> get copyWith =>
      __$$AttractionsImplCopyWithImpl<_$AttractionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttractionsImplToJson(
      this,
    );
  }
}

abstract class _Attractions implements Attractions {
  const factory _Attractions(
      {required final List<Attraction> historical,
      required final List<Attraction> nature,
      required final List<Attraction> sport,
      required final List<Attraction> entertain}) = _$AttractionsImpl;

  factory _Attractions.fromJson(Map<String, dynamic> json) =
      _$AttractionsImpl.fromJson;

  @override
  List<Attraction> get historical;
  @override
  List<Attraction> get nature;
  @override
  List<Attraction> get sport;
  @override
  List<Attraction> get entertain;

  /// Create a copy of Attractions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttractionsImplCopyWith<_$AttractionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attraction _$AttractionFromJson(Map<String, dynamic> json) {
  return _Attraction.fromJson(json);
}

/// @nodoc
mixin _$Attraction {
  String get name => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this Attraction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attraction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttractionCopyWith<Attraction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionCopyWith<$Res> {
  factory $AttractionCopyWith(
          Attraction value, $Res Function(Attraction) then) =
      _$AttractionCopyWithImpl<$Res, Attraction>;
  @useResult
  $Res call({String name, String desc, List<String> images});
}

/// @nodoc
class _$AttractionCopyWithImpl<$Res, $Val extends Attraction>
    implements $AttractionCopyWith<$Res> {
  _$AttractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attraction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionImplCopyWith<$Res>
    implements $AttractionCopyWith<$Res> {
  factory _$$AttractionImplCopyWith(
          _$AttractionImpl value, $Res Function(_$AttractionImpl) then) =
      __$$AttractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String desc, List<String> images});
}

/// @nodoc
class __$$AttractionImplCopyWithImpl<$Res>
    extends _$AttractionCopyWithImpl<$Res, _$AttractionImpl>
    implements _$$AttractionImplCopyWith<$Res> {
  __$$AttractionImplCopyWithImpl(
      _$AttractionImpl _value, $Res Function(_$AttractionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Attraction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? desc = null,
    Object? images = null,
  }) {
    return _then(_$AttractionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttractionImpl implements _Attraction {
  const _$AttractionImpl(
      {required this.name,
      required this.desc,
      required final List<String> images})
      : _images = images;

  factory _$AttractionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttractionImplFromJson(json);

  @override
  final String name;
  @override
  final String desc;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'Attraction(name: $name, desc: $desc, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, desc, const DeepCollectionEquality().hash(_images));

  /// Create a copy of Attraction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionImplCopyWith<_$AttractionImpl> get copyWith =>
      __$$AttractionImplCopyWithImpl<_$AttractionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttractionImplToJson(
      this,
    );
  }
}

abstract class _Attraction implements Attraction {
  const factory _Attraction(
      {required final String name,
      required final String desc,
      required final List<String> images}) = _$AttractionImpl;

  factory _Attraction.fromJson(Map<String, dynamic> json) =
      _$AttractionImpl.fromJson;

  @override
  String get name;
  @override
  String get desc;
  @override
  List<String> get images;

  /// Create a copy of Attraction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttractionImplCopyWith<_$AttractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Services _$ServicesFromJson(Map<String, dynamic> json) {
  return _Services.fromJson(json);
}

/// @nodoc
mixin _$Services {
  String get taxi => throw _privateConstructorUsedError;
  List<String> get map => throw _privateConstructorUsedError;

  /// Serializes this Services to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Services
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServicesCopyWith<Services> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesCopyWith<$Res> {
  factory $ServicesCopyWith(Services value, $Res Function(Services) then) =
      _$ServicesCopyWithImpl<$Res, Services>;
  @useResult
  $Res call({String taxi, List<String> map});
}

/// @nodoc
class _$ServicesCopyWithImpl<$Res, $Val extends Services>
    implements $ServicesCopyWith<$Res> {
  _$ServicesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Services
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxi = null,
    Object? map = null,
  }) {
    return _then(_value.copyWith(
      taxi: null == taxi
          ? _value.taxi
          : taxi // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicesImplCopyWith<$Res>
    implements $ServicesCopyWith<$Res> {
  factory _$$ServicesImplCopyWith(
          _$ServicesImpl value, $Res Function(_$ServicesImpl) then) =
      __$$ServicesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String taxi, List<String> map});
}

/// @nodoc
class __$$ServicesImplCopyWithImpl<$Res>
    extends _$ServicesCopyWithImpl<$Res, _$ServicesImpl>
    implements _$$ServicesImplCopyWith<$Res> {
  __$$ServicesImplCopyWithImpl(
      _$ServicesImpl _value, $Res Function(_$ServicesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Services
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxi = null,
    Object? map = null,
  }) {
    return _then(_$ServicesImpl(
      taxi: null == taxi
          ? _value.taxi
          : taxi // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value._map
          : map // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicesImpl implements _Services {
  const _$ServicesImpl({required this.taxi, required final List<String> map})
      : _map = map;

  factory _$ServicesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServicesImplFromJson(json);

  @override
  final String taxi;
  final List<String> _map;
  @override
  List<String> get map {
    if (_map is EqualUnmodifiableListView) return _map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_map);
  }

  @override
  String toString() {
    return 'Services(taxi: $taxi, map: $map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServicesImpl &&
            (identical(other.taxi, taxi) || other.taxi == taxi) &&
            const DeepCollectionEquality().equals(other._map, _map));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taxi, const DeepCollectionEquality().hash(_map));

  /// Create a copy of Services
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicesImplCopyWith<_$ServicesImpl> get copyWith =>
      __$$ServicesImplCopyWithImpl<_$ServicesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicesImplToJson(
      this,
    );
  }
}

abstract class _Services implements Services {
  const factory _Services(
      {required final String taxi,
      required final List<String> map}) = _$ServicesImpl;

  factory _Services.fromJson(Map<String, dynamic> json) =
      _$ServicesImpl.fromJson;

  @override
  String get taxi;
  @override
  List<String> get map;

  /// Create a copy of Services
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServicesImplCopyWith<_$ServicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
