import 'dart:io'; // مهم
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  final String? path;
  final String? text;

  const PdfViewerScreen({super.key, this.path, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text ?? 'Guide'),
      ),
      body: path != null
          ? SfPdfViewer.file(File(path!))
          : const Center(child: Text('No PDF file found')),
    );
  }
}
