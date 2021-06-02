import 'package:flutter/material.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/total_balance.dart';

class RentScreen extends StatefulWidget {
  static const id = 'Rent';

  @override
  _RentScreenState createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  int balance = 2894;
  final balanceContoller = TextEditingController();
  List<String> _chosenValue = ['Now', 'One Off'];
  List<String> title = ['When', 'Frequency'];
  List<String> listWhen = <String>['Now'];
  List<String> listFrequency = <String>[
    "One Off",
    "Daily",
    "Weekly",
    "Monthly"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(
        context,
        text: RentScreen.id,
        showLeading: true,
        showAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              MyTotalBalanceWidget(totalBalance: balance.toString()),
              SizedBox(
                height: 20,
              ),
              buildYourBalance(context),
              Column(
                  children: List.generate(
                2,
                (index) => buildRentList(index: index),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Container buildYourBalance(context) {
    return Container(
      color: ConstantColors.lightGreen,
      padding: EdgeInsets.fromLTRB(14, 8, 8, 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 55,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Balance',
            style: ConstantStyles.textStyle16,
          ),
          Container(
            // height: 80,
            decoration: BoxDecoration(
              color: ConstantColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 160,

            child: TextFormField(
              cursorColor: ConstantColors.white,
              controller: balanceContoller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 4, right: 4, top: 5),

                hoverColor: ConstantColors.white,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: OutlineInputBorder(),

                focusColor: ConstantColors.white,
                suffixIcon: buildSuffixIcon(context),

                // labelText: 'Email',
                fillColor: ConstantColors.white,
              ),

              keyboardType: TextInputType.number,
              // controller: emailController,
            ),
          )
        ],
      ),
    );
  }

  Widget buildSuffixIcon(context) {
    return GestureDetector(
      onTap: () => hanldeAddTap(),
      child: Container(
        width: 73,
        decoration: BoxDecoration(
            color: ConstantColors.darkGreen,
            borderRadius: BorderRadius.circular(4)),
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  Container buildRentList({required int index}) {
    return Container(
      color: ConstantColors.lightGreen,
      padding: EdgeInsets.fromLTRB(14, 8, 8, 8),
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 55,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title[index],
            style: ConstantStyles.textStyle16,
          ),
          buildDropdownButton(index: index)
        ],
      ),
    );
  }

  Widget buildDropdownButton({required int index}) {
    List<String> list;
    index == 0 ? list = listWhen : list = listFrequency;
    return Container(
      // width: 120,
      child: DropdownButton<String>(
        focusColor: Colors.white,
        value: _chosenValue[index],
        //elevation: 5,
        style: TextStyle(color: Colors.white),
        iconEnabledColor: ConstantColors.gray1,
        icon: Icon(
          Icons.keyboard_arrow_down,
        ),
        underline: SizedBox.shrink(),

        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: ConstantColors.gray1),
            ),
          );
        }).toList(),

        onChanged: (String? value) {
          setState(() {
            _chosenValue[index] = value!;
          });
        },
      ),
    );
  }

  Row tempDropDown(String textOnEnd) {
    return Row(
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
    );
  }

  bool validation({required String value}) {
    return int.tryParse(value) != null ? true : false;
  }

  hanldeAddTap() {
    //Hide keyboard when add button is pressed
    FocusManager.instance.primaryFocus!.unfocus();

    if (validation(value: balanceContoller.text)) {
      setState(() {
        balance = balance + int.parse(balanceContoller.text);
      });
      balanceContoller.clear();
    } else {
      // Utils.myErrorDialog(context: context, message: 'Please enter number');
      print('Enter number');
    }
  }
}
