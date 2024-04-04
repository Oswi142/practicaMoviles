import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practica/popular_movies_cubit.dart';
import 'package:flutter_practica/cart_cubit.dart';

class PopularMoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              final cartCubit = context.read<CartCubit>();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Carrito de compras'),
                  content: Text('Total: \$${cartCubit.total.toStringAsFixed(2)}'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PopularMoviesCubit, List<dynamic>>(
        builder: (context, movies) {
          return ListView.builder(
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
                onTap: () => showMovieDetails(context, movie),
              );
            },
          );
        },
      ),
    );
  }

  void showMovieDetails(BuildContext context, dynamic movie) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie['title'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(movie['overview']),
                SizedBox(height: 8),
                Text(
                  'Precio: \$19.99',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    context.read<CartCubit>().addToCart(19.99);
                    Navigator.of(context).pop();
                  },
                  child: Text('Agregar al carrito'),
                ),
                SizedBox(height: 8),
                Image.network(
                  'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                  width: 200,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
