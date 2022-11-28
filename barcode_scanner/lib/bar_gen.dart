import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarCodeGen extends StatefulWidget {
  const BarCodeGen({super.key});

  @override
  State<BarCodeGen> createState() => _BarCodeGenState();
}

class _BarCodeGenState extends State<BarCodeGen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: "123456789",
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}