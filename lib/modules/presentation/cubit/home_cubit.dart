import 'package:bloc_todo/modules/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(userData: [], isLoading: true));

  Future<void> fetchData() async {
    print("hello");
    Future.delayed(const Duration(seconds: 0)).then((value) {
      emit(state.copywith(isLoading: false, user: []));
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
