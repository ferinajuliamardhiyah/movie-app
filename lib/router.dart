import 'package:flutter/material.dart';
import 'package:movie_app/detail.dart';
import 'package:movie_app/list.dart';
import 'package:movie_app/pages.dart';

class Router {
  Route<dynamic> getRoute(settings) {
    Map<String, dynamic> arguments = settings.arguments;

    switch (settings.name) {
      case Pages.List:
       return _buildRoute(settings, AllListFilm());
      case Pages.Detail:
       return _buildRoute(settings, DetailFilm(films: arguments['films']));
      default:
      return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
  }
}