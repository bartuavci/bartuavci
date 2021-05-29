import 'package:flutter/material.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/total_balance.dart';

class RentScreen extends StatelessWidget {
  static const id = 'Rent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(
        context,
        text: id,
        showLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              MyTotalBalance(totalBalance: 'PKR 2,894'),
              buildYourBalance(),
              buildRentList(textOnEnd: "Now", title: "When"),
              buildRentList(textOnEnd: "One Off", title: "Frequency"),
            ],
          ),
        ),
      ),
    );
  }

  Container buildYourBalance() {
    return Container(
      color: ConstantColors.lightGreen,
      padding: EdgeInsets.fromLTRB(14, 8, 8, 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Balance',
            style: ConstantStyles.textStyle16,
          ),
          Container(
            decoration: BoxDecoration(
                color: ConstantColors.white,
                borderRadius: BorderRadius.circular(10)),
            width: 160,
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ConstantColors.darkGreen,
                          borderRadius: BorderRadius.circular(4)),
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      // height: 35,
                      child: Row(
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(color: ConstantColors.white),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: ConstantColors.white,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Container buildRentList({required String title, required String textOnEnd}) {
    return Container(
      color: ConstantColors.lightGreen,
      padding: EdgeInsets.fromLTRB(14, 8, 8, 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ConstantStyles.textStyle16,
          ),
          Row(
            children: [
              Text(
                textOnEnd,
                style: TextStyle(color: ConstantColors.gray1),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: ConstantColors.gray1,
              )
            ],
          )
        ],
      ),
    );
  }
}
