import 'package:cv_pdf_maker/features/home/home.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false,
            ));
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/cv-pdf.png'),
      ),
    );
  }
}
