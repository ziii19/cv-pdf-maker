part of 'input_bloc.dart';

class InputEvent extends Equatable {
  const InputEvent();

  @override
  List<Object> get props => [];
}

class InitialInput extends InputEvent {}

class ChangeInput extends InputEvent {
  final InputModel input;

  const ChangeInput({required this.input});

  @override
  List<Object> get props => [input];
}

class ChangeImageInput extends InputEvent {
  final ImageSource source;

  const ChangeImageInput({required this.source});
}
