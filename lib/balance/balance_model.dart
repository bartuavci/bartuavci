import 'dart:convert';

class BalanceModel {
  String homeBalance;
  String paymentBalance;

  BalanceModel({
    required this.homeBalance,
    required this.paymentBalance,
  });

  Map<String, dynamic> toMap() {
    return {
      'homeBalance': homeBalance,
      'paymentBalance': paymentBalance,
    };
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(
      homeBalance: map['homeBalance'],
      paymentBalance: map['paymentBalance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BalanceModel.fromJson(String source) =>
      BalanceModel.fromMap(json.decode(source));
}

// class PaymentData {
//   static List<PaymentModel> paymentList = [
//     PaymentModel(
//       homeBalance: 'homeBalance1',
//       paymentBalance: 'paymentBalance1',
//     ),
//     PaymentModel(
//       homeBalance: 'homeBalance1',
//       paymentBalance: 'paymentBalance1',
//     )
//   ];
// }
