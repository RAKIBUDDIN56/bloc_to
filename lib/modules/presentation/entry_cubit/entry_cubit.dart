import 'package:bloc_todo/modules/presentation/cubit/home_state.dart';
import 'package:bloc_todo/modules/presentation/entry_cubit/entry_state.dart';
import 'package:bloc_todo/modules/presentation/entry_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryCubit extends Cubit<EntryState> {
  EntryCubit() : super(EntryState(dob: ""));

  updateGender(SingingCharacter value) {
    emit(state.copywith(character: value));
  }

  dobUpdate(String date) {
    emit(state.copywith(dob: date));
  }

  @override
  Future<void> close() {
    // dispose
    return super.close();
  }
}
