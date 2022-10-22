import 'package:flutter/widgets.dart';
import 'package:flutter_anime/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieServices extends ChangeNotifier {
  List<MovieModel>? movieList;
  List<MovieModel> get getMovieList => movieList ?? [];

  Future<void> fetchMovie() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      movieList = <MovieModel>[];
      var data = json.decode(response.body);
      for (var i = 0; i < data.length; i++) {
        movieList?.add(
          MovieModel.fromJson(data[i]),
        );
      }
      notifyListeners();
    }
  }
}
