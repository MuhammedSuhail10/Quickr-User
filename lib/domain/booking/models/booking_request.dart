import 'dart:io';
import 'package:quickr_user_flutter_app/domain/booking/models/service_item.dart';

class BookingRequest {
  final File workImage;
  final List<ServiceItem> services;
  final bool isImmediate;
  final String scheduledDate;
  final String scheduledTime;
  final int addressId;
  final String alternateName;
  final String alternatePhoneNumber;
  final String notes;

  BookingRequest({
    required this.workImage,
    required this.services,
    required this.isImmediate,
    required this.scheduledDate,
    required this.scheduledTime,
    required this.addressId,
    required this.alternateName,
    required this.alternatePhoneNumber,
    required this.notes,
  });

  Map<String, dynamic> dataToJson() => {
    'services': services.map((x) => x.toJson()).toList(),
    'is_immediate': isImmediate,
    'scheduled_date': scheduledDate,
    'scheduled_time': scheduledTime,
    'address_id': addressId,
    'alternate_name': alternateName,
    'alternate_phone_number': alternatePhoneNumber,
    'notes': notes,
  };
}
