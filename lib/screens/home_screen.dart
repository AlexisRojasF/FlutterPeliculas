import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProviders = Provider.of<MoviesProviders>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas en cines'),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(movies: moviesProviders.onDysplayMovies),
              MovieSliders(
                movies: moviesProviders.popularMovies,
                title: 'Populares!',
                onNexPage: () => moviesProviders.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
