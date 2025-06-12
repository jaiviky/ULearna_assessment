import 'package:assessment/src/presentation/blocs/reels_cubit/reels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/src/presentation/pages/home.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ReelsCubit()..fetchData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
