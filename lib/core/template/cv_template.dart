import 'dart:io';

import 'package:create_pdf/home/blocs/input/input_bloc.dart';
import 'package:pdf/widgets.dart' as pw;

class CreateCv {
  CreateCv._();

  static Future<(String message, bool success)> createPdf(
      {InputState? input}) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(
      File(input!.image!.path).readAsBytesSync(),
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              children: [
                pw.Container(
                  width: 100,
                  height: 100,
                  decoration: pw.BoxDecoration(
                    shape: pw.BoxShape.circle,
                    image: pw.DecorationImage(
                      image: image,
                      fit: pw.BoxFit.cover,
                    ),
                  ),
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  input.name ?? '',
                  style: pw.TextStyle(
                    fontSize: 32,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'About Me',
              style: pw.TextStyle(
                fontSize: 24,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              input.about ?? '',
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'EDUCATION',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              input.education ?? '',
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'SKILLS',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              input.skills ?? '',
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'LANGUAGES',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              input.language ?? '',
              style: const pw.TextStyle(fontSize: 16),
            ),
            pw.SizedBox(height: 20),
            pw.Text(
              'ORGANIZATION EXPERIENCE',
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Text(
              input.organization ?? '',
              style: const pw.TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );

    try {
      final directory = Directory('/storage/emulated/0/Download');
      final file = File('${directory.path}/${input.filePath}.pdf');

      if (await file.exists()) {
        return ('File already exists', false);
      }

      await file.writeAsBytes(await pdf.save());
      return ('PDF saved at ${file.path}', true);
    } catch (e) {
      return ('Failed: $e', false);
    }
  }
}
