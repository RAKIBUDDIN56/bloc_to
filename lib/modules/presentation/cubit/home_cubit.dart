import 'package:bloc_todo/modules/model/user_model.dart';
import 'package:bloc_todo/modules/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(userData: User(), isLoading: true));

  Future<void> fetchData() async {
    print("hello");
    Future.delayed(const Duration(seconds: 3)).then((value) {
      emit(state.copywith(
          isLoading: false, user: User.fromJson({"id": 001, "name": "Sakib"})));
      print(state.isLoading);
    });
  }

  void printsomething() {
    print("Clicked");
  }

  @override
  Future<void> close() {
    // dispose
    return super.close();
  }
}
