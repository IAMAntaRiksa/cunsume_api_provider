import 'package:flutter/material.dart';
import 'package:flutter_anime/services/movie_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Anime"),
      ),
      body: const SingleChildScrollView(child: HomeBody()),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieServices>(context);

    if (movieProvider.getMovieList != null) {
      movieProvider.fetchMovie();
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Daftar Api",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          movieProvider.getMovieList != null
              ? const ListMovie()
              : const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}

class ListMovie extends StatelessWidget {
  const ListMovie({super.key});
  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieServices>(context);

    return ListView.builder(
      itemCount: movieProvider.getMovieList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Text(
                  movieProvider.getMovieList[index].title ?? '',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Text(
                  movieProvider.getMovieList[index].body ?? '',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
