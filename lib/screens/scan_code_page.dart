import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanCodePage extends StatefulWidget {
  const ScanCodePage({super.key});

  @override
  State<ScanCodePage> createState() => _ScanCodePageState();
}

class _ScanCodePageState extends State<ScanCodePage> {
  void _handleQRCode(String? scannedData, Uint8List? image) {
    if (scannedData == null || scannedData.isEmpty) return;

    Uri? url = Uri.tryParse(scannedData);

    if (url != null && (url.scheme == "http" || url.scheme == "https")) {
      // If it's a valid URL, open it in browser
      launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Show scanned text in a dialog if not a link
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Scanned Data",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade800),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (image != null) Image.memory(image, fit: BoxFit.cover),
                const SizedBox(height: 10),
                Text(scannedData, style: TextStyle(color: Colors.blue.shade700)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade300,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.width * 0.85,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
                returnImage: true,
              ),
              onDetect: (capture) {
                final List<Barcode> barCodes = capture.barcodes;
                final Uint8List? image = capture.image;

                for (final barCode in barCodes) {
                  String? scannedData = barCode.rawValue;
                  _handleQRCode(scannedData, image);
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.popAndPushNamed(context, '/generate'),
        backgroundColor: Colors.blue.shade800,
        child: const Icon(Icons.qr_code_2, color: Colors.white),
      ),
    );
  }
}
