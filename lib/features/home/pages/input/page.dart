import 'dart:io';

import 'package:cv_pdf_maker/core/components/content_sheets.dart';
import 'package:cv_pdf_maker/core/components/regular_text_input.dart';
import 'package:cv_pdf_maker/core/template/cv_template.dart';
import 'package:cv_pdf_maker/features/home/blocs/input/input_bloc.dart';
import 'package:cv_pdf_maker/features/home/home.dart';
import 'package:cv_pdf_maker/features/home/pages/main/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'section/pick_confirm_section.dart';
part 'section/input_section.dart';
part 'section/save_section.dart';

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
    context.read<InputBloc>().add(InitialInput());
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
                  child: BlocBuilder<InputBloc, InputState>(
                    builder: (context, state) {
                      if (state.image != null) {
                        return Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.3),
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: FileImage(File(state.image!.path)),
                                  fit: BoxFit.cover)),
                        );
                      }
                      return Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(
                          Icons.add_photo_alternate,
                          size: 80,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const _InputSection(),
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
            BlocBuilder<InputBloc, InputState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: state.isValid
                            ? () {
                                saveat();
                              }
                            : () {
                                showAlert();
                              },
                        child: Text(
                          'Download CV',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('All fields are required!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ini menutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void saveat() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const _SaveSection(),
    );
  }

  void pickImageFrom() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const _PickConfirm(),
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
