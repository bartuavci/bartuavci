import 'package:flutter/material.dart';
import '../shared/constant/colors.dart';
import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/total_balance.dart';
import 'rent_screen.dart';
import 'spaces_model.dart';

class SpacesScreen extends StatelessWidget {
  static const id = 'Spaces';
  final List<SpacesModel> spacesList = [
    SpacesModel(
      color: Color(0xffCFE3F5),
      name: 'Main Account',
      price: 'PKR 5,894',
      imageUrl: '',
    ),
    SpacesModel(
      color: Color(0xffDDDEF0),
      name: 'Trip to Thailand',
      price: 'PKR 1,894',
      imageUrl: '',
    ),
    SpacesModel(
      color: Color(0xffFCDBDB),
      name: 'Rent',
      price: '',
      imageUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(context, text: id),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTotalBalance(
              totalBalance: '220,000',
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                children: List.generate(
                  4,
                  (index) => index != 3
                      ? buildList(index, context)
                      : buildCreateNew(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCreateNew(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Utils.screenWidth(context: context) / 3,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: ConstantColors.graylight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                size: 40,
              ),
              Text('Create New Space')
            ],
          ),
        ),
      ],
    );
  }

  Widget buildList(index, BuildContext context) {
    return GestureDetector(
      onTap: () => handeTap(context, index: index),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(31),
              color: spacesList[index].color,
            ),
            height: Utils.screenWidth(context: context) / 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/spaces/image_${index + 1}.png',
                    width: Utils.screenWidth(context: context) / 7,
                  ),
                ),
              ],
            ),
          ),
          Text(
            spacesList[index].name,
            style: ConstantStyles.textStyle15,
          ),
          Text(
            spacesList[index].price,
            style: ConstantStyles.textStyleGrey1,
          )
        ],
      ),
    );
  }

  handeTap(BuildContext context, {required int index}) {
    if (index == 2) Navigator.pushNamed(context, RentScreen.id);
  }
}
