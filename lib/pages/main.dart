import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_tecnica_courses/data/Bloc/blocCourses.dart';
import 'package:prueba_tecnica_courses/data/models/coursesModel.dart';
import 'package:prueba_tecnica_courses/pages/detalleCourse.dart';
import 'package:prueba_tecnica_courses/pages/drawer.dart';

class mainCourses extends StatefulWidget {
  @override
  mainCourses_State createState() => mainCourses_State();
}

class mainCourses_State extends State<mainCourses> {
  int buscador = 0;
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;

    var _spacing = altura * 0.26;
    var _crossAxisCount = 2;
    var width = ((ancho - (_crossAxisCount - 1) * _spacing)) / _crossAxisCount;
    var celHeight = altura * .18;
    var aspectratio = width / celHeight;
    TextEditingController busquedaControllerc = new TextEditingController();

    Widget buscadorC() {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        margin: EdgeInsets.all(0),
        height: 35,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 0, left: 0),
                child: TextFormField(
                  onChanged: (value) {
                    listaCursos.filtercursos.add(value);
                  },
                  controller: busquedaControllerc,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      backgroundColor: Colors.white),
                  keyboardType: TextInputType.text,
                  autocorrect: true,
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    isDense: true,

                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xffafafaf),
                    ),

                    hintText: "Buscar Curso",
                    hintStyle: TextStyle(
                        color: Color(0xffbcbcbc),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: Color(0xffc9c9c9))
                        // borderSide: new BorderSide(color: Colors.teal)
                        ),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: Colors.grey[500])
                        // borderSide: new BorderSide(color: Colors.teal)
                        ),
                    // labelText: 'Correo'
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1ba6d2),
          brightness: Brightness.light,
          title: buscador == 0 ? Text("Cursos Principales") : buscadorC(),
          centerTitle: true,
          actions: <Widget>[
            buscador == 0
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        buscador = 1;
                        print("BUSCADOR=>" + buscador.toString());
                      });
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        buscador = 0;
                        print("BUSCADOR=>" + buscador.toString());
                      });
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
          ],
        ),
        drawer: drawerPrincipal(
          pag: 2,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Cursos disponibles",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 12,
              child: Container(
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: StreamBuilder<List<CourseModel>>(
                    stream: listaCursos.cursosList,
                    builder: (Context, snapshot) {
                      return snapshot.hasData
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: aspectratio,
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: altura * 0.34,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .46,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          detalleCourse(
                                                            cursoSelected:
                                                                snapshot.data[
                                                                    index],
                                                          )));
                                            },
                                            child: Card(
                                              elevation: 3,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 13,
                                                      bottom: 8),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Center(
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 60,
                                                              width: 70,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white,
                                                                image:
                                                                    DecorationImage(
                                                                  image: AssetImage('assets/images/' +
                                                                      snapshot
                                                                          .data[
                                                                              index]
                                                                          .image),
                                                                ),
                                                              ),
                                                              child: SizedBox(),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Flexible(
                                                            child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .nombreCurso,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffb7b7b7),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      "TrebuchetMS",
                                                                  fontSize: snapshot
                                                                              .data[
                                                                                  index]
                                                                              .nombreCurso
                                                                              .length >
                                                                          10
                                                                      ? altura *
                                                                          0.022
                                                                      : altura *
                                                                          0.025),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Flexible(
                                                            flex: 1,
                                                            child: Text(
                                                              snapshot
                                                                  .data[index]
                                                                  .descriptionShort,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                          .grey[
                                                                      600]),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "Precio:  " +
                                                                new String
                                                                        .fromCharCodes(
                                                                    new Runes(
                                                                        '\u0024')) +
                                                                snapshot
                                                                    .data[index]
                                                                    .precio
                                                                    .floor()
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .grey[700],
                                                                fontSize: 16),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "Cupos (" +
                                                                snapshot
                                                                    .data[index]
                                                                    .numEstudiates
                                                                    .toString() +
                                                                ")",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey[400]),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: RatingBar(
                                                              itemSize: 14,
                                                              initialRating:
                                                                  snapshot
                                                                      .data[
                                                                          index]
                                                                      .calificacion,
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  false,
                                                              itemCount: 5,
                                                              itemPadding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          0),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      Icon(
                                                                Icons.star,
                                                                size: 1,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {
                                                                print(rating);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  side: BorderSide.none),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                  ),
                );
              }),
            ),



*/
