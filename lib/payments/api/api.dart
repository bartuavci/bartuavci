import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:neo/payments/api/api_exceptions.dart';
import 'package:neo/payments/data/balance_model.dart';

class Api {
  final ref = FirebaseDatabase.instance.reference();

  Future<String> getBalanceOnly({required String userId}) async {
    try {
      final response = await http.get(Uri.parse(
          // 'https://neo-mvp-database-default-rtdb.europe-west1.firebasedatabase.app/balances/user$userId/balance/.json'
          'https://testing-483b1.firebaseio.com/balances/user$userId/balance/.json'));
      return _responseBalanceOnly(response);
    } on SocketException {
      throw AppException(
          message: "Connection Problem! Check your internet and try again.");
    } on TimeoutException {
      throw AppException(message: "Connection time out");
    }
  }

  String _responseBalanceOnly(http.Response response) {
    switch (response.statusCode) {
      case 200:
        String responseString = response.body.toString().replaceAll("\"", "");
        print(responseString);
        return responseString;

      default:
        throw AppException(
            message:
                'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<BalancesModel> getBalancesAll() async {
    try {
      final response = await http
          .get(Uri.parse('https://testing-483b1.firebaseio.com/.json'));
      return _responseBalanceAll(response);
    } on SocketException {
      throw AppException(
          message: "Connection Problem! Check your internet and try again.");
    } on TimeoutException {
      throw AppException(message: "Connection time out");
    }
  }

  BalancesModel _responseBalanceAll(http.Response response) {
    switch (response.statusCode) {
      case 200:
        BalancesModel responseModel = BalancesModel.fromJson(response.body);
        print(responseModel);
        return responseModel;

      default:
        throw AppException(
          message:
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
