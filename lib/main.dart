import 'package:flutter/material.dart';
import 'package:flutter_practica/popular_movie.dart';

void main() {
  runApp(const PopularMovies());
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PopularMoviesScreen(),
    );
  }
}
