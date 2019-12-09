import 'package:flutter/material.dart';
import 'package:movie_app/pages.dart';
import 'package:movie_app/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      initialRoute: Pages.List,
      onGenerateRoute: Router().getRoute,
    );
  }
}