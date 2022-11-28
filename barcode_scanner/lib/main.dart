import 'package:barcode_scanner/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BarCodeScanner());
}

class BarCodeScanner extends StatelessWidget {
  const BarCodeScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
