import 'package:flutter/material.dart';
import 'package:intania_reunion_regist/qrscanneroverlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter QR Scanner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QRScanner'),
        actions: [
          IconButton(
            onPressed: () {
              cameraController.switchCamera();
            },
            icon: const Icon(Icons.camera_rear_outlined),
          )
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (barcode, args) {
              debugPrint('Barcode Found!' + barcode.rawValue!);
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      ),
    );
  }
}
