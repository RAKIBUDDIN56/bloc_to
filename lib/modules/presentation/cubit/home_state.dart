import 'package:bloc_todo/modules/model/user_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<User>? userData;

  const HomeState({this.isLoading = true, this.userData});

  HomeState copywith({bool? isLoading, List<User>? user}) => HomeState(
      isLoading: isLoading ?? this.isLoading, userData: user ?? []);

  @override
  List<Object?> get props => [isLoading, userData];
}
