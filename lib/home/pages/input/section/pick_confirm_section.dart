part of '../page.dart';

class _PickConfirm extends StatelessWidget {
  const _PickConfirm();

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
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
                  context
                      .read<InputBloc>()
                      .add(const ChangeImageInput(source: ImageSource.camera));
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
                  context
                      .read<InputBloc>()
                      .add(const ChangeImageInput(source: ImageSource.gallery));
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.filter,
                  size: 80,
                )),
          ),
        ],
      ),
    ));
  }
}
