import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner/screens/qr_scanner.dart';

class QrGenetator extends StatefulWidget {
  const QrGenetator({super.key});

  @override
  State<QrGenetator> createState() => _QrGenetatorState();
}

class _QrGenetatorState extends State<QrGenetator> {
  TextEditingController textController = TextEditingController();
  String myString = "";

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("QR Gennerator"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ),
                PrettyQrView.data(
                  data: myString,
                  decoration: const PrettyQrDecoration(
                    image: PrettyQrDecorationImage(
                      image: NetworkImage(
                          'https://i.pinimg.com/originals/60/80/b7/6080b79aa634c88da889315d6567d61d.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QrScanner(),
                          ),
                        );
                      },
                      child: const Text("Scan QR Code"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: textController,
                  onChanged: (e) {
                    setState(() {
                      myString = e;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Enter QR Code Text",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
