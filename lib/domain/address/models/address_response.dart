class AddressResponse {
  final bool? status;
  final List<Address>? address;

  AddressResponse({
    this.status,
    this.address,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      status: json['status'],
      address: json['address'] != null
          ? List<Address>.from(
              json['address'].map((x) => Address.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'address': address?.map((e) => e.toJson()).toList(),
    };
  }
}

class Address {
  final int? id;
  final int? districtId;
  final String? addressLine1;
  final String? landmark;
  final double? longitude;
  final double? latitude;
  final String? postalCode;
  final String? alternateName;
  final String? alternatePhoneNumber;

  Address({
    this.id,
    this.districtId,
    this.addressLine1,
    this.landmark,
    this.longitude,
    this.latitude,
    this.postalCode,
    this.alternateName,
    this.alternatePhoneNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      districtId: json['district_id'],
      addressLine1: json['address_line1'],
      landmark: json['landmark'],
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      postalCode: json['postal_code'],
      alternateName: json['alternate_name'],
      alternatePhoneNumber: json['alternate_phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'district_id': districtId,
      'address_line1': addressLine1,
      'landmark': landmark,
      'longitude': longitude,
      'latitude': latitude,
      'postal_code': postalCode,
      'alternate_name': alternateName,
      'alternate_phone_number': alternatePhoneNumber,
    };
  }
}
