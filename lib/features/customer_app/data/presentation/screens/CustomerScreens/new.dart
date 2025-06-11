import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لإضافة rootBundle
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {
  final String assetPath; // مسار الأصول
  final String text;

  const PdfViewerScreen(
      {super.key, required this.assetPath, required this.text});

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late Future<Uint8List> _loadPdfFile; // متغير لحمل ملف PDF

  @override
  void initState() {
    super.initState();
    _loadPdfFile = _loadPdf();
  }

  Future<Uint8List> _loadPdf() async {
    return await rootBundle
        .load(widget.assetPath)
        .then((data) => data.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: FutureBuilder<Uint8List>(
        future: _loadPdfFile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading PDF: ${snapshot.error}'));
          } else {
            return SfPdfViewer.memory(snapshot.data!); // عرض PDF من الذاكرة
          }
        },
      ),
    );
  }
}
