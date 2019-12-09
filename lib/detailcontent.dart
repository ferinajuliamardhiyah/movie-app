// import 'package:dio/dio.dart';
// import 'dart:convert';

// class DetailContent {
//   String title;
//   String poster;
//   String background;
//   String overview;
//   int runtime;
//   int id;
//   var vote;
//   var voteCount;

//   DetailContent.fromJson(Map<String, dynamic> json)
//       : title = json['title'],
//         poster = json['poster_path'],
//         background = json['backdrop_path'],
//         overview = json['overview'],
//         runtime = json['runtime'],
//         id = json['id'],
//         voteCount = json['vote_count'],
//         vote = json['vote_average'];

//   static getDetails(id) async {
//     var result = await Dio().get(
//         'https://api.themoviedb.org/3/movie/$id?api_key=d3afb5ba2f51532b4d77bda3e1fba203&language=en-US');
//     Map<String, dynamic> det = json.decode(result.data);
//     DetailContent details = DetailContent.fromJson(det);
//     print(details);
//     return details;
//   }
// }
