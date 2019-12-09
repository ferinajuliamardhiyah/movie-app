import 'package:flutter/material.dart';
import 'package:movie_app/film.dart';
import 'package:movie_app/pages.dart';

class AllListFilm extends StatefulWidget {
  _AllListFilmState createState() => _AllListFilmState();
}

class _AllListFilmState extends State<AllListFilm> {
  List<Film> nows;
  List<Film> populars;
  List<Film> tops;
  List<Film> upcomings;
  bool loading = true;

  void getMovies() async {
    var now = await Film.getFilms('now_playing');
    var popular = await Film.getFilms('popular');
    var top = await Film.getFilms('top_rated');
    var upcoming = await Film.getFilms('upcoming');

    setState(() {
      nows = now;
      populars = popular;
      tops = top;
      upcomings = upcoming;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('This Year Movies'),
        ),
        body: loading == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[CircularProgressIndicator()])
            : ListView(children: <Widget>[
                ListTitle('NOW PLAYING'),
                ListFilm(nows.length, nows),
                ListTitle('POPULAR'),
                ListFilm(populars.length, populars),
                ListTitle('TOP RATED'),
                ListFilm(tops.length, tops),
                ListTitle('UPCOMING'),
                ListFilm(upcomings.length, upcomings)
              ]));
  }
}

class ListFilm extends StatelessWidget {
  final length;
  final films;

  ListFilm(this.length, this.films);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        height: MediaQuery.of(context).size.height * 0.47,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Pages.Detail,
                      arguments: {'films': films[index]});
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Card(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Image.network(
                              'https://image.tmdb.org/t/p/original${films[index].poster}',
                              fit: BoxFit.fitWidth,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(top: 10, left: 5),
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height: 30,
                                      child: Text(films[index].title)),
                                  Container(
                                      color: Colors.black26,
                                      margin: EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      height: 18,
                                      child: Text('${films[index].vote}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold))),
                                ])
                          ],
                        ))),
              );
            }));
  }
}

class ListTitle extends StatelessWidget {
  final title;

  ListTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10, right: 200),
        padding: EdgeInsets.only(left: 20),
        color: Colors.blue[300],
        child: Text(title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)));
  }
}
