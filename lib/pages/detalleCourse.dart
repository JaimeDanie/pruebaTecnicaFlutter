import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_tecnica_courses/data/models/coursesModel.dart';

class detalleCourse extends StatelessWidget {
  final CourseModel cursoSelected;
  detalleCourse({@required this.cursoSelected});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1ba6d2),
        brightness: Brightness.light,
        title: Text(cursoSelected.nombreCurso),
      ),
      body: Container(
        height: altura,
        color: Colors.grey[200],
        padding: EdgeInsets.all(14),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: altura * .42,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/' + cursoSelected.image),
                      ),
                    ),
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          cursoSelected.descriptionShort,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500]),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cupos (" +
                            cursoSelected.numEstudiates.toString() +
                            ")",
                        style: TextStyle(color: Colors.grey[400]),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: RatingBar(
                          itemSize: 30,
                          initialRating: cursoSelected.calificacion,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            size: 1,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: altura * .01),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xff1ba6d2).withOpacity(.2)),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Text(
                      "Precio: " +
                          new String.fromCharCodes(new Runes('\u0024')) +
                          cursoSelected.precio.floor().toString(),
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: altura * .05,
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  Text(
                    "Lo que debes saber",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: altura * 0.03,
                  ),
                  Text(
                    cursoSelected.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
