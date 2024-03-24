import 'package:flutter/material.dart';
import 'package:scannerapp/views/bar_scanner_view.dart';
import 'package:scannerapp/views/qr_scanner_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.qr_code, size: 40,)),
            Tab(icon: Icon(Icons.qr_code_scanner, size: 40,)),
          ],
        ),
        title: const Text('Device Scanner'),
      ),
      body: const TabBarView(
        children: [
          BarScannerView(),
          QRScannerView(),
        ],
      ),
      ),
    );
  }
}
