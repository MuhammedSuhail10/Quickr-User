class ServiceItem {
  final int serviceId;
  final int quantity;

  ServiceItem({required this.serviceId, required this.quantity});

  Map<String, dynamic> toJson() => {
    'service_id': serviceId,
    'quantity': quantity,
  };
}
