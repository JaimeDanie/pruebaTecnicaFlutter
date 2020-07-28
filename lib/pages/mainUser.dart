import 'package:flutter/material.dart';
import 'package:prueba_tecnica_courses/pages/drawer.dart';

class mainUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1ba6d2),
          brightness: Brightness.light,
          title: Text("Home"),
          centerTitle: true,
        ),
        drawer: drawerPrincipal(
          pag: 1,
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.home,
                  size: 250,
                  color: Color(0xff1ba6d2),
                ),
              ),
              Center(
                child: Text("Bienvenido a JaimeSoft Courses"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
