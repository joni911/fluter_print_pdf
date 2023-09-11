import 'package:flutter/material.dart';
import 'pdf_creator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final PdfCreator pdfCreator = PdfCreator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PDF App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter PDF App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  pdfCreator.createPdf();
                  await pdfCreator.printPdf();
                },
                child: Text('Buat & Cetak PDF'),
              ),
              ElevatedButton(
                onPressed: () async {
                  pdfCreator.createPdf();
                  final file = await pdfCreator.savePdf();
                  await pdfCreator.sharePdf(file);
                },
                child: Text('Buat & Bagikan PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}