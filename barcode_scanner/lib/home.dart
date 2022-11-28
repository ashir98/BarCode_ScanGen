import 'package:barcode_scanner/bar_gen.dart';
import 'package:barcode_scanner/bar_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex =0;
  final List<Widget> screens =[
    BarCodeScan(),
    BarCodeGen()

  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
          indicatorColor: Colors.blue,
          
        )

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("BarCode Scanner")
        ),

        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),

        bottomNavigationBar: NavigationBar(
          
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.code),
              label: "Scan",
            ),
            NavigationDestination(
              icon: Icon(Icons.code_off),
              label: "Generate",
            )
          ],
        ),
      ),
    );
  }
}