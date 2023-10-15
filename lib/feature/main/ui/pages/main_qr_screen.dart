import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:izobility_mobile/utils/ui/colors.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class MainQrScreen extends StatefulWidget {
  const MainQrScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainQrScreenState();
}

class _MainQrScreenState extends State<MainQrScreen> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((event) {
                    this.controller = controller;
                    log(event.code.toString());
                  });
                },
              )),
        ],
      ),
    );
  }
}
