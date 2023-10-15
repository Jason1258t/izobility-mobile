import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:izobility_mobile/feature/wallet/bloc/promo_code/promo_code_cubit.dart';
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
                overlay: QrScannerOverlayShape(
                    borderColor: AppColors.primary,
                    borderRadius: 10,
                    borderLength: 50,
                    borderWidth: 5,
                    ),
                onQRViewCreated: (controller) {
                  controller.scannedDataStream.listen((data) {
                    this.controller = controller;
                    controller.stopCamera();
                    log("QR CODE ${data.code.toString()}");
                    context
                        .read<PromoCodeCubit>()
                        .activateCode(data.code.toString());
                    context.pop();
                  });
                },
              )),
        ],
      ),
    );
  }
}
