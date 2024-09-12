import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_event.dart';
import 'package:nekomimi/featureas/home/bloc/Locals/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(locale: null)) {
    on<ChangeLanguageEvent>((event, emit) {
      emit(LanguageState(locale: event.locale));
    });
  }
}
