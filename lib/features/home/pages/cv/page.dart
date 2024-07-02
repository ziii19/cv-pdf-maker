import 'package:cv_pdf_maker/features/home/pages/input/page.dart';
import 'package:flutter/material.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/image.png'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InputCv()));
            },
            child: const Text(
              'Edit CV',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
