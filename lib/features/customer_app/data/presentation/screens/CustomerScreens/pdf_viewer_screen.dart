import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String? path;
  final String? text;

  const PdfViewerScreen({super.key, this.path, this.text});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('pp:$path');
    print('pp:$text');

    return Scaffold(
      appBar: AppBar(
        title: Text(text ?? 'Guied'),
      ),
      body: path != null
          ? SfPdfViewer.network(path!) // استخدام مكتبة Syncfusion
          : const Center(child: Text('No PDF file found')),
    );
  }
}
