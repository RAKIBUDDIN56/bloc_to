import 'package:bloc_todo/modules/presentation/cubit/home_cubit.dart';
import 'package:bloc_todo/modules/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, state) {
            return state.isLoading
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Text(state.userData!.name!),
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<HomeCubit>(context)
                                .printsomething();
                          },
                          child: const Text("Click me"))
                    ],
                  );
          },
        ),
      ),
    ));
  }
}
