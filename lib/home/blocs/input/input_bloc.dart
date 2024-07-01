import 'package:cv_pdf_maker/core/helper/image_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputState.initial()) {
    on<InitialInput>((event, emit) {
      emit(InputState.initial());
    });
    on<ChangeInput>((event, emit) {
      emit(state.copywith(
        about: event.about,
        name: event.name,
        skills: event.skills,
        education: event.education,
        language: event.language,
        organization: event.organization,
        filePath: event.filePath,
      ));
    });

    on<ChangeImageInput>((event, emit) async {
      final image = await ImageHelper.getImage(event.source);
      emit(state.copywith(image: image!));
    });
  }
}
