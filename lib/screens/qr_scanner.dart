import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Scanner"),
      ),
      body: MobileScanner(
        controller: MobileScannerController(
          returnImage: true,
          detectionSpeed: DetectionSpeed.noDuplicates,
        ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          final Uint8List? image = capture.image;

          // for (final barcode in barcodes) {
          //   print('barcode foud ${barcode.rawValue}');
          // }

          if (image != null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(barcodes.first.rawValue ?? ""),
                  content: Image(
                    image: MemoryImage(image),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
