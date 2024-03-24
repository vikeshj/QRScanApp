import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';

class QRScannerView extends StatefulWidget {
  const QRScannerView({super.key});

  @override
  State<QRScannerView> createState() => _QRScannerViewState();
}

class _QRScannerViewState extends State<QRScannerView> {
  String? _qrInfo = 'Scan a QR/Bar Code';
  bool _isScanning = false;

  qrCallback(String code) {
    setState(() {
      _qrInfo = code;
      _isScanning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isScanning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isScanning = !_isScanning;
            _qrInfo = 'Scan a QR/Bar Code';
          });
        },
        child: const Icon(Icons.camera),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isScanning
                ? Center(
                    child: SizedBox(
                    width: 1000,
                    height: 500,
                    child: QRBarScannerCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (String? code) {
                        qrCallback(code!);
                      },
                    ),
                  ))
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          _qrInfo!,
                          style: const TextStyle(fontSize: 25),
                        ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
