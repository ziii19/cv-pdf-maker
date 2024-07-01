import 'package:create_pdf/core/components/content_sheets.dart';
import 'package:create_pdf/core/components/regular_text_input.dart';
import 'package:create_pdf/core/helper/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class InputCv extends StatefulWidget {
  const InputCv({super.key});

  @override
  State<InputCv> createState() => _InputCvState();
}

class _InputCvState extends State<InputCv> {
  XFile? xfile;
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isVisible) setState(() => _isVisible = false);
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isVisible) setState(() => _isVisible = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Cv'),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InputTitle('Photo'),
                GestureDetector(
                  onTap: () {
                    pickImageFrom();
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Icon(
                      Icons.add_photo_alternate,
                      size: 80,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const InputTitle('About Me'),
                const RegularTextInput(
                  hintText: 'My name is .........',
                  maxLines: 8,
                ),
                const SizedBox(height: 20),
                const InputTitle('Education'),
                const RegularTextInput(hintText: 'TK\nSD\nSMP\nSMA'),
                const SizedBox(height: 20),
                const InputTitle('Skills'),
                const RegularTextInput(hintText: 'Content Writing\nProgrammer'),
                const SizedBox(height: 20),
                const InputTitle('Language'),
                const RegularTextInput(hintText: 'English\nIndonesia'),
                const SizedBox(height: 20),
                const InputTitle('Organization Experience'),
                const RegularTextInput(
                    hintText:
                        '2017 - 2018 Pramuka SD Wapinru\n2019 - 2020 Pramuka SMP Pinru\nJuly 2022 - present PMR Bendahara'),
                const SizedBox(height: 100),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isVisible ? kBottomNavigationBarHeight : 0.0,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Download CV',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickImageFrom() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ContentSheet(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(.2),
              ),
              child: IconButton(
                  onPressed: () {
                    ImageHelper.getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                    size: 80,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(.2),
              ),
              child: IconButton(
                  onPressed: () {
                    ImageHelper.getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.filter,
                    size: 80,
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

class InputTitle extends StatelessWidget {
  const InputTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
