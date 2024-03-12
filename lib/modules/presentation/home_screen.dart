import 'package:bloc_todo/modules/presentation/cubit/home_cubit.dart';
import 'package:bloc_todo/modules/presentation/cubit/home_state.dart';
import 'package:bloc_todo/modules/presentation/entry_screen.dart';
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
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, state) {
            return state.isLoading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    itemCount: state.userData!.length,
                    itemBuilder: (context, index) {
                      return const Text("Hello");
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>  EntryScreen(),
              ),
            );
          },
          label: const Text("+")),
    ));
  }
}
