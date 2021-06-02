import 'package:neo/balance/balance_model.dart';
import 'package:firebase_database/firebase_database.dart';

class BalanceApi {
  final ref = FirebaseDatabase.instance.reference();
  List<BalanceModel> payment = [];

  Future<List<BalanceModel>> getBalances() async {
    try {
      await ref.child('balances').once().then((DataSnapshot data) {
        return handleData(data.value);
      });
    } catch (e) {
      print(e.toString());
    }
    return payment;
  }

  List<BalanceModel> handleData(value) {
    payment.clear();
    for (int i = 0; i < value.length; i++) {
      payment.add(
        BalanceModel(
          homeBalance: value[i]['homeBalance'],
          paymentBalance: value[i]['paymentBalance'],
        ),
      );
    }
    print("payment " + payment.toString());
    return payment;
  }

  Future<void> updateBalance(List<BalanceModel> paymentList) async {
    await ref.child('balances').set(paymentList.map((e) => e.toMap()).toList());
  }
}
