import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practica/popular_movies_cubit.dart';
import 'package:flutter_practica/popular_movies_screen.dart';

void main() {
  runApp(const PopularMoviesApp());
}

class PopularMoviesApp extends StatelessWidget {
  const PopularMoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PopularMoviesCubit()..getMovies(),
        child: PopularMoviesScreen(),
      ),
    );
  }
}
