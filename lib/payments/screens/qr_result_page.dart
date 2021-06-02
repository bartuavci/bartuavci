import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:neo/payments/api/api.dart';
import 'package:neo/payments/screens/send_screen.dart';
import 'package:neo/payments/screens/sent_screen.dart';

import 'package:neo/shared/constant/colors.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/shared/utils.dart';
import 'package:neo/shared/widgets/button.dart';
import 'package:neo/user/user_data.dart';

class QrResultPage extends StatefulWidget {
  final String qrData;

  static const String id = 'QrResultPage';

  const QrResultPage({Key? key, required this.qrData}) : super(key: key);
  @override
  _QrResultPageState createState() => _QrResultPageState();
}

class _QrResultPageState extends State<QrResultPage> {
  static const int itemLength = 10;
  List<bool> completed =
      List.generate(itemLength, (index) => Random().nextBool());

  final ref = FirebaseDatabase.instance.reference();
  final _amountController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double _width = Utils.screenWidth(context: context) / 1.4;
    // double _height = Utils.screenHeight(context: context) / 1.5;

    return Scaffold(
        appBar: Utils.myAppBar(
          context,
          text: 'Send',
          showAction: true,
          showLeading: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: 14,
              right: 14,
              top: 50,
            ),
            width: double.maxFinite,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      BASE_QR_URL + 'qr_blur.png',
                      width: _width,
                      height: _width,
                    ),
                    Container(
                      width: _width + 40,
                      height: _width - 100,
                      decoration: BoxDecoration(
                        color: ConstantColors.lightGreen,
                        border: Border.all(
                          width: 4,
                          color: ConstantColors.darkGreen,
                        ),
                      ),
                      child: _buildTextFormField(),
                    )
                  ],
                ),
                _isLoading ? CircularProgressIndicator() : buildSendButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildSendButton() {
    return InkWell(
      onTap: () => _amountController.text.length != 0
          ? postPayment(
              userId: widget.qrData, amount: int.parse(_amountController.text))
          : Utils.myErrorDialog(
              context: context,
              message: 'Amount is required',
            ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: MyButton(text: 'Send'),
      ),
    );
  }

  void postPayment({required String userId, required int amount}) {
    setState(() {
      _isLoading = true;
    });
    Api().getBalancesAll().then(
      (value) {
        if (userId == UserData.userIdList[0].toString()) {
          ref
              .child('balances')
              .child('user0')
              .child('paymentBalance')
              .set(value.balances.user0.paymentBalance - amount);
          ref
              .child('balances')
              .child('user1')
              .child('homeBalance')
              .set(value.balances.user1.homeBalance + amount)
              .then((value) => handleSuccess())
              .catchError((error) => handleError(error));
        } else {
          ref
              .child('balances')
              .child('user1')
              .child('paymentBalance')
              .set(value.balances.user1.paymentBalance - amount);

          ref
              .child('balances')
              .child('user0')
              .child('homeBalance')
              .set(value.balances.user0.homeBalance + amount)
              .then((value) => handleSuccess())
              .catchError(
                (error) => handleError(error),
              );
        }
      },
    );
  }

  Future<dynamic> handleError(error) {
    setState(() {
      _isLoading = false;
    });
    return Utils.myErrorDialog(
      context: context,
      message: error.message,
    );
  }

  _buildTextFormField() {
    var textStyle = TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w600,
    );
    return Center(
      child: TextFormField(
        cursorColor: ConstantColors.white,
        controller: _amountController,

        style: textStyle,
        decoration: InputDecoration(
          // contentPadding:
          //     EdgeInsets.only(left: 10, right: 8, top: 5, bottom: 5),

          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PKR',
              style: textStyle,
            ),
          ),

          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: OutlineInputBorder(),

          // focusColor: ConstantColors.white,

          // labelText: 'Email',
          // fillColor: ConstantColors.white,
        ),

        keyboardType: TextInputType.number,
        // controller: emailController,
      ),
    );
  }

  handleSuccess() {
    Navigator.pushNamed(context, SentScreen.id);
  }
}
