import 'dart:io';
import 'package:create_pdf/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as f;
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MainApp());
}

class _PDFGenerator extends f.StatefulWidget {
  const _PDFGenerator();

  @override
  _PDFGeneratorState createState() => _PDFGeneratorState();
}

class _PDFGeneratorState extends f.State<_PDFGenerator> {
  Future<void> createPdf() async {
    final pdf = pw.Document();
    final img = await rootBundle.load('assets/fall.png');
    final imageBytes = img.buffer.asUint8List();
    pw.Image image1 = pw.Image(pw.MemoryImage(imageBytes));

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
                    // image: pw.DecorationImage(
                    //   image: image1 as ImageProvider,
                    //   fit: pw.BoxFit.cover,
                    // ),
                  ),
                  child: image1,
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  'ESTY DEWI LESTARI',
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
              'Nama saya adalah Esty Dewi Lestari, umumnya dikenal sebagai Esty atau Dewi. Saya berusia 16 tahun, lahir pada tanggal 02 Juni 2007. Saya tinggal di Dk. Gedong Rt 01 Rw.04, Kelurahan Sonorejo, Kecamatan Sukoharjo, Kabupaten Sukoharjo. Saya memiliki ketertarikan yang kuat dalam menjalankan sebuah organisasi dan ikut serta dalam kegiatan sosial, serta mengikuti beberapa ekskul di sekolah.',
              style: pw.TextStyle(fontSize: 16),
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
              'TK Kencana Sari 2018 - 2019\nMIN 6 Sukoharjo 2014 - 2019\nSMP Negeri 3 Grogol 2019 - 2022\nSMK Muhammadiyah 1 Sukoharjo 2022 - Present',
              style: pw.TextStyle(fontSize: 16),
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
              '* turuu\n• mangan',
              style: pw.TextStyle(fontSize: 16),
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
              'Indonesia\nEnglish',
              style: pw.TextStyle(fontSize: 16),
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
              '2017 - 2018 Pramuka SD Wapinru\n2019 - 2020 Pramuka SMP Pinru\nJuly 2022 - present PMR Bendahara',
              style: pw.TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );

    final directory = Directory('/storage/emulated/0/Download');
    final file = File('${directory.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
    print('PDF saved at ${file.path}');
  }

  Future<void> checkPermission() async {
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();

      // I noticed that sometimes popup won't show after user press deny
      // so I do the check once again but now go straight to appSettings
      if (permissionStatus.isDenied) {
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    }
  }

  void showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Izin Diperlukan'),
          content: const Text(
              'Aplikasi memerlukan izin akses penyimpanan untuk menyimpan file. Silakan aktifkan di pengaturan.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await openAppSettings();
              },
              child: const Text('Buka Pengaturan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  // Future<void> savePDF() async {
  //   // await checkPermission();

  //   final status = await Permission.storage.status;

  //   // if (status.isGranted) {
  //   final directory = Directory('/storage/emulated/0/Download');
  //   final file = File('${directory.path}/resume.pdf');
  //   await file.writeAsBytes(await pdf.save());
  //   print('PDF saved at ${file.path}');
  //   // } else {
  //   //   print('Permission denied');
  //   // }
  // }

  @override
  f.Widget build(f.BuildContext context) {
    return f.Scaffold(
      appBar: f.AppBar(
        title: const f.Text('PDF Generator'),
      ),
      body: f.Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const f.Center(
            child: f.Text('Generating PDF...'),
          ),
          f.ElevatedButton(
            onPressed: () {
              createPdf();
            },
            child: const Text('Download Pdf'),
          )
        ],
      ),
    );
  }
}
