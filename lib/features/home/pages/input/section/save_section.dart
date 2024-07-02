part of '../page.dart';

class _SaveSection extends StatefulWidget {
  const _SaveSection();

  @override
  State<_SaveSection> createState() => _SaveSectionState();
}

class _SaveSectionState extends State<_SaveSection> {
  TextEditingController pathController = TextEditingController();

  @override
  void initState() {
    pathController.addListener(() {
      context.read<InputBloc>().add(ChangeInput(filePath: pathController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    pathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularTextInput(
              hintText: 'File name',
              controller: pathController,
            ),
            const SizedBox(height: 50),
            BlocBuilder<InputBloc, InputState>(
              builder: (context, state) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: state.isSave
                        ? () async {
                            final result = await CreateCv.createPdf(
                              input: state.input,
                            );

                            showAlert(result.$1, result.$2);
                          }
                        : null,
                    child: const Text(
                      'Download Cv',
                      style: TextStyle(color: Colors.white),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }

  void showAlert(String message, bool isResult) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isResult ? 'Success' : 'Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: isResult
                  ? () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const MainPage()),
                        (route) => false,
                      );
                    }
                  : () {
                      Navigator.pop(context);
                    },
              child: const Text('OK'),
            ),
          ],
        );
      },
    ).then((value) {
      return isResult
          ? () {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const MainPage()),
                (route) => false,
              );
            }
          : () {
              Navigator.pop(context);
            };
    });
  }
}
