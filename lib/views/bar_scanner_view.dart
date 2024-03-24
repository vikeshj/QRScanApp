import 'dart:io';
import 'dart:math';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarScannerView extends StatefulWidget {
  const BarScannerView({super.key});

  @override
  State<BarScannerView> createState() => _BarScannerViewState();
}

class _BarScannerViewState extends State<BarScannerView> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  var code = '';
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  controller: title,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: ' Code ',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                setState(() {
                  code = title.text;
                });
              },
              child: const Text(
                'Generate',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            code == ''
                ? Text('')
                : Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: BarcodeWidget(
                      barcode: Barcode.qrCode(
                        errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                      ),
                      data: '$code',
                      width: 200,
                      height: 200,
                    ),
                ),
          ],
        ),
      )),
    );
  }
}
