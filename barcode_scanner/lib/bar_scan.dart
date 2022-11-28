import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodeScan extends StatefulWidget {
  const BarCodeScan({super.key});

  @override
  State<BarCodeScan> createState() => _BarCodeScanState();
}

class _BarCodeScanState extends State<BarCodeScan> {

  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      darkTheme: ThemeData.dark(
        useMaterial3: true
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    Text("SCAN RESULT",style: TextStyle(fontSize: 15),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 3),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        width: 300,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                            scanResult == null?"Scan a code":"$scanResult",
                            style: TextStyle(fontSize: 20),
                            
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: scanBarcode,
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: Colors.blue,
                  ),
                  child: Text("Scan BarCode", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),),
                ),
              )
            ],
          ),
        )
      ),
    );
  }








  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#03b1fc", "cancel", true, ScanMode.BARCODE);
    } on PlatformException {
      scanResult = "";
    }

    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
  }
}


