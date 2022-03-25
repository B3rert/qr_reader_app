import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/providers/provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   "#3D8BEF",
        //   "Cancelar",
        //   false,
        //   ScanMode.QR,
        // );

        int rand = Random().nextInt(2);

        String barcodeScanRes =
            "https://pub.dev/packages/flutter_barcode_scanner";
        SnackBar snackBar = const SnackBar(content: Text('Insert in table'));

        if (rand == 0) {
          barcodeScanRes = "https://pub.dev/packages/flutter_barcode_scanner";
          snackBar = const SnackBar(content: Text('Insert in directions'));
        } else {
          barcodeScanRes = "geo:15.33,15.66";
          snackBar = const SnackBar(content: Text('Insert in maps'));
        }

        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(snackBar);
        final listScanProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        listScanProvider.nuevoScan(barcodeScanRes);
      },
    );
  }
}
