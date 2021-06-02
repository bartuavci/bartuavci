import 'package:neo/shared/constant/values.dart';

import 'payments_model.dart';

final List<PaymentsModel> paymentsList = [
  PaymentsModel(
    time: 'Today',
    payments: [
      Payment(
        name: 'Food Panda',
        date: '21, March',
        imageUrl: '${BASE_PAYMENTS_URL}image_1.png',
        price: '- PKR 1,894',
      ),
      Payment(
        name: 'Bartu Avci',
        date: '21, March',
        imageUrl: '${BASE_PAYMENTS_URL}image_2.png',
        price: '- PKR 3,454',
      ),
    ],
  ),
  PaymentsModel(
    time: 'Yesterday',
    payments: [
      Payment(
        name: 'Rent',
        date: '20, March',
        imageUrl: '${BASE_PAYMENTS_URL}image_3.png',
        price: '- PKR 7,894',
      ),
      Payment(
        name: 'Travel',
        date: '20, March',
        imageUrl: '${BASE_PAYMENTS_URL}image_4.png',
        price: '- PKR 6,454',
      ),
    ],
  ),
];
