// ignore_for_file: avoid_print

import 'package:belajar_bloc_lagi/screen/screen.dart';
import 'package:belajar_bloc_lagi/src/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/bloc/page/page_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> PageBloc()),
      BlocProvider(create: (context) => ThemeBloc()),
    ], child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (_, themeState) => MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: const Wrapper())));
  }
}

