import 'package:flutter/material.dart';
import 'package:prueba_tecnica_courses/pages/home.dart';
import 'package:prueba_tecnica_courses/pages/main.dart';
import 'package:prueba_tecnica_courses/pages/mainUser.dart';

class drawerPrincipal extends StatelessWidget {
  final int pag;
  drawerPrincipal({@required this.pag});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  margin: EdgeInsets.all(0),
                  decoration:
                      BoxDecoration(color: Color(0xff1ba6d2).withOpacity(.5)),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/person.png')),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Center(
                          child: Text(
                            "Jaime Soft",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: pag == 1 ? Color(0xff1ba6d2) : Colors.white,
                  child: ListTile(
                    selected: pag == 1 ? true : false,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => mainUser()));
                    },
                    leading: Icon(
                      Icons.home,
                      color: pag == 1 ? Colors.white : Colors.grey[300],
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                          color: pag == 1 ? Colors.white : Colors.grey[600]),
                    ),
                  ),
                ),
                Container(
                  color: pag == 2 ? Color(0xff1ba6d2) : Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => mainCourses()));
                    },
                    leading: Icon(
                      Icons.book,
                      color: pag == 2 ? Colors.white : Colors.grey[300],
                    ),
                    title: Text(
                      "Courses",
                      style: TextStyle(
                          color: pag == 2 ? Colors.white : Colors.grey[600]),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey[300],
                  ),
                  title: Text(
                    "Salir",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
