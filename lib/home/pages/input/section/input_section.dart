part of '../page.dart';

class _InputSection extends StatefulWidget {
  const _InputSection();

  @override
  State<_InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<_InputSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController organizationController = TextEditingController();

  @override
  void initState() {
    nameController.addListener(() {
      context.read<InputBloc>().add(ChangeInput(name: nameController.text));
    });
    aboutController.addListener(() {
      context.read<InputBloc>().add(ChangeInput(about: aboutController.text));
    });
    educationController.addListener(() {
      context
          .read<InputBloc>()
          .add(ChangeInput(education: educationController.text));
    });
    skillsController.addListener(() {
      context.read<InputBloc>().add(ChangeInput(skills: skillsController.text));
    });
    languageController.addListener(() {
      context
          .read<InputBloc>()
          .add(ChangeInput(language: languageController.text));
    });
    organizationController.addListener(() {
      context
          .read<InputBloc>()
          .add(ChangeInput(organization: organizationController.text));
    });
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    aboutController.dispose();
    educationController.dispose();
    skillsController.dispose();
    languageController.dispose();
    organizationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InputTitle('Name'),
        RegularTextInput(
          hintText: 'James tween',
          controller: nameController,
        ),
        const SizedBox(height: 20),
        const InputTitle('About Me'),
        RegularTextInput(
          hintText: 'My name is .........',
          maxLines: 8,
          controller: aboutController,
        ),
        const SizedBox(height: 20),
        const InputTitle('Education'),
        RegularTextInput(
          hintText: 'TK\nSD\nSMP\nSMA',
          controller: educationController,
        ),
        const SizedBox(height: 20),
        const InputTitle('Skills'),
        RegularTextInput(
          hintText: 'Content Writing\nProgrammer',
          controller: skillsController,
        ),
        const SizedBox(height: 20),
        const InputTitle('Language'),
        RegularTextInput(
          hintText: 'English\nIndonesia',
          controller: languageController,
        ),
        const SizedBox(height: 20),
        const InputTitle('Organization Experience'),
        RegularTextInput(
          hintText:
              '2017 - 2018 Pramuka SD Wapinru\n2019 - 2020 Pramuka SMP Pinru\nJuly 2022 - present PMR Bendahara',
          controller: organizationController,
        ),
      ],
    );
  }
}
