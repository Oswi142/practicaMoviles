import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class PopularMoviesScreen extends StatefulWidget {
  @override
  _PopularMoviesScreenState createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen> {
  final Dio dio = Dio();
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  void getHttp() async {
    try {
      final response = await dio.get(
          'https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3');
      setState(() {
        movies = response.data['results'];
      });
    } catch (e) {
      print('Error fetching popular movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie['title']),
            subtitle: Text(movie['overview']),
            leading: Image.network(
              'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
              width: 100,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}