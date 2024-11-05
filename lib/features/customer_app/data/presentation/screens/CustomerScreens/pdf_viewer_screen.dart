import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PdfViewerScreen extends StatefulWidget {
  final String? path;
  final String? text;

  const PdfViewerScreen({super.key, this.path, this.text});

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  FileInfo? _cachedFile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCachedPdf();
  }

  Future<void> _loadCachedPdf() async {
    if (widget.path != null) {
      final file = await DefaultCacheManager().getSingleFile(widget.path!);
      setState(() {
        _cachedFile = FileInfo(
            file, FileSource.Cache, DateTime.now(), DateTime.now().toString());
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text ?? 'Guide'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _cachedFile != null
              ? SfPdfViewer.file(_cachedFile!.file)
              : const Center(child: Text('No PDF file found')),
    );
  }
}
