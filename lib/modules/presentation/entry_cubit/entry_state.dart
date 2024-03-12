import 'package:bloc_todo/modules/model/user_model.dart';
import 'package:equatable/equatable.dart';

enum SingingCharacter { male, female }

class EntryState extends Equatable {
  final int gender;
  final String? dob;
  SingingCharacter character = SingingCharacter.male;

  EntryState(
      {this.gender = 0, this.dob, this.character = SingingCharacter.male});

  EntryState copywith(
          {int? gender, String? dob, SingingCharacter? character}) =>
      EntryState(
          gender: gender ?? this.gender,
          dob: dob ?? this.dob,
          character: character ?? this.character);

  @override
  List<Object?> get props => [gender, dob, character];
}
