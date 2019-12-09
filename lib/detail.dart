import 'package:flutter/material.dart';
//import 'package:movie_app/detailcontent.dart';
import 'package:movie_app/film.dart';

// class DetailFilm extends StatefulWidget {
//   final id;
//   DetailFilm(this.id);

//   _DetailFilmState createState() => _DetailFilmState(id);
// }

// class _DetailFilmState extends State<DetailFilm> {
//   final id;
//   _DetailFilmState(this.id);

//   DetailContent details;
//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     getDetail();
//   }

//   void getDetail() async {
//     var detail = await DetailContent.getDetails(id);
//     setState(() {
//       details = detail;
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: loading == true
//       ? CircularProgressIndicator()
//       : Stack(
//         alignment: AlignmentDirectional.topCenter,
//         children: <Widget>[
//           Container(
//             child: Image.network(
//                 'https://image.tmdb.org/t/p/original${details.background}',
//                 fit: BoxFit.fitWidth),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 50),
//             width: MediaQuery.of(context).size.width*0.7,
//             height: MediaQuery.of(context).size.height*0.8,
//             child: Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(details.title),
//                   Image.network('https://image.tmdb.org/t/p/original${details.poster}',
//                   height: 200,
//                   width: 150),
//                   Text('${details.runtime} minutes'),
//                   Text(details.overview, textAlign: TextAlign.justify)
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class DetailFilm extends StatelessWidget {
  final Film films;

  DetailFilm({Key key, @required this.films}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.grey])),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              Container(
                child: Image.network(
                    'https://image.tmdb.org/t/p/original${films.background}',
                    fit: BoxFit.fitWidth),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: 5, top: 10, bottom: 10, right: 10),
                          child: Image.network(
                              'https://image.tmdb.org/t/p/original${films.poster}',
                              height: 200,
                              width: 150),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue[300])),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: 
                              Text('${films.vote}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)))
                              ]
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text(films.title, style: TextStyle(fontSize: 16, color: Colors.lightBlue)),
                            )
                          ],
                        )
                      ]),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child:
                            Text(films.overview, textAlign: TextAlign.center),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
