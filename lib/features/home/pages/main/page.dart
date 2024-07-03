import 'package:cv_pdf_maker/features/about/pages/pages.dart';
import 'package:cv_pdf_maker/features/home/home.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  final pages = <Widget>[
    const HomePage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CV Pdf Maker',
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => setState(() {
          selectedPage = value;
        }),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (value) {
            pageController.jumpToPage(value);
            setState(() {
              selectedPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'About'),
          ]),
    );
  }
}
