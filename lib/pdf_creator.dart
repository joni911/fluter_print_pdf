import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

class PdfCreator {
  final pw.Document pdf = pw.Document();

  void createPdf() {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World', style: pw.TextStyle(fontSize: 40)),
        ),
      ),
    );
  }

  Future<File> savePdf() async {
    final List<int> bytes = await pdf.save();
    final Directory dir = await getTemporaryDirectory();
    final File file = File("${dir.path}/example.pdf");
    await file.writeAsBytes(bytes);
    return file;
}

  Future<void> printPdf() async {
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }

  Future<void> sharePdf(File file) async {
    await Share.shareFiles([file.path], subject: 'Berikut dokumen PDF Anda.');
  }
}