import 'package:dio/dio.dart';

class Film {
  String title;
  String poster;
  String background;
  String overview;
  int id;
  var vote;
  var voteCount;

  Film.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = json['poster_path'],
        background = json['backdrop_path'],
        overview = json['overview'],
        id = json['id'],
        voteCount = json['vote_count'],
        vote = json['vote_average'];

 static getFilms(category) async {
    var result =
        await Dio().get('https://api.themoviedb.org/3/movie/$category?api_key=d3afb5ba2f51532b4d77bda3e1fba203&language=en-US&page=1');
    List<Film> films = (result.data['results'] as List)
        .map((test) => Film.fromJson(test))
        .toList();
    return films;
  }

}
