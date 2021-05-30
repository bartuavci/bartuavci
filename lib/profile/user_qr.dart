import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neo/shared/constant/values.dart';
import 'package:neo/user/user_data.dart';
import 'package:neo/user/user_model.dart';
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
      body: FutureBuilder(
        future: UserData().currentUserInfo(),
        builder: (context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
                child: Column(
                  children: [
                    MyQrCodeWidget(
                      imageName: snapshot.data!.qrCode,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.name,
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      snapshot.data!.userName,
                      style: ConstantStyles.textStyleGrey3,
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => handleTap(snapshot.data!.qrCode),
                          child: MyButton(
                            text: 'Share',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  handleTap(String url) async {
    // Share.shareFiles([BASE_QR_URL + 'ma.png'], text: "My Qr code");
    final ByteData bytes = await rootBundle.load(BASE_QR_URL + url);
    await WcFlutterShare.share(
      sharePopupTitle: 'Share',
      fileName: 'ma.png',
      mimeType: 'image/png',
      bytesOfFile: bytes.buffer.asUint8List(),
    );
  }
}
