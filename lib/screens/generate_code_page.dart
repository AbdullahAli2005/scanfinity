import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateCodePage extends StatefulWidget {
  const GenerateCodePage({super.key});

  @override
  State<GenerateCodePage> createState() => _GenerateCodePageState();
}

class _GenerateCodePageState extends State<GenerateCodePage> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.popAndPushNamed(context, '/scan'),
            icon: const Icon(Icons.qr_code_2, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Enter text to generate QR",
                hintStyle: TextStyle(color: Colors.blue.shade800),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.text_fields, color: Colors.blue.shade800),
              ),
            ),
            const SizedBox(height: 20),
            if (qrData != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade300,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: PrettyQrView.data(
                  data: qrData!,
                  decoration: PrettyQrDecoration(
                    shape: PrettyQrSmoothSymbol(), // Stylish QR design
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
