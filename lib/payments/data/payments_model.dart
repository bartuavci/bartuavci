class PaymentsModel {
  final String time;
  final List<Payment> payments;
  PaymentsModel({
    required this.time,
    required this.payments,
  });
}

class Payment {
  final String name;
  final String date;
  final String imageUrl;
  final String price;
  Payment({
    required this.name,
    required this.date,
    required this.imageUrl,
    required this.price,
  });
}
