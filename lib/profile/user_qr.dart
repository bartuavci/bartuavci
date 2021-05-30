import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';
import '../shared/constant/styles.dart';
import '../shared/utils.dart';
import '../shared/widgets/button.dart';
import '../shared/widgets/qr_code.dart';

class UserQrScreen extends StatelessWidget {
  static const id = 'UserQr';
  const UserQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.myAppBar(
        context,
        text: "QR Code",
        showLeading: true,
        showAction: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
          child: Column(
            children: [
              MyQrCodeWidget(
                imageName: 'user2.png',
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'M Akbar ',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                '@Akbar6584',
                style: ConstantStyles.textStyleGrey3,
              ),
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => handleTap(),
                    child: MyButton(
                      text: 'Share',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  handleTap() async {
    // Share.shareFiles([BASE_QR_URL + 'ma.png'], text: "My Qr code");
    final ByteData bytes = await rootBundle.load(BASE_QR_URL + 'user2.png');
    await WcFlutterShare.share(
      sharePopupTitle: 'Share',
      fileName: 'ma.png',
      mimeType: 'image/png',
      bytesOfFile: bytes.buffer.asUint8List(),
    );
  }
}
