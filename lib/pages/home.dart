import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:prueba_tecnica_courses/pages/main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int visiblec = 1;
  int visiblepass = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _showDialog(String msj) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(msj),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Aceptar"),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // systemNavigationBarColor: Colors.grey[200], // navigation bar color
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //statusBarBrightness: Brightness.dark
    ));
    //print("INIT");

    KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
      //print("ACA CARE VERGA");
      setState(() {
        visiblec = visible ? 0 : 1;
        print(visiblec);
      });
      // print(MediaQuery.of(context).size.height);
    });
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Future.value(false);
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: altura,
          padding: EdgeInsets.all(altura * .012),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: altura * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "JaimeSoft Courses",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: ancho * .08,
                          color: Color(0xff1ba6d2),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    )
                  ],
                ),
                SizedBox(
                  height: altura * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      curve: Curves.easeOut,
                      duration: Duration(
                        milliseconds: 600,
                      ),
                      height: visiblec == 1 ? altura * .20 : 0,
                      width: 180,
                      child: Image.asset('assets/images/login.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: altura * 0.038,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .92,
                  child: TextField(
                    controller: usernameController,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: MediaQuery.of(context).size.height * .018),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: true,
                    autofocus: false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),

                      prefixIcon:
                          Icon(Icons.person_outline, color: Colors.grey[500]),
                      labelText: 'Usuario',

                      // fillColor: Colors.white,
                      labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: MediaQuery.of(context).size.height * .018),
                      enabledBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey[300])
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
                SizedBox(
                  height: altura * 0.02,
                ),
                SizedBox(
                  height: altura * .05,
                  width: ancho * .92,
                  child: TextField(
                    controller: passwordController,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: MediaQuery.of(context).size.height * .018),
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: true,
                    autofocus: false,
                    obscureText: visiblepass == 1 ? false : true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),

                      enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: Colors.grey[300]),

                        // borderSide: new BorderSide(color: Colors.teal)
                      ),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey[500])
                          // borderSide: new BorderSide(color: Colors.teal)
                          ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            visiblepass == 1
                                ? visiblepass = 0
                                : visiblepass = 1;
                          });
                        },
                        child: Icon(
                          visiblepass == 0
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey[400],
                          size: MediaQuery.of(context).size.height * 0.034,
                        ),
                      ),
                      prefixIcon:
                          Icon(Icons.lock_outline, color: Colors.grey[500]),
                      labelText: 'Contraseña',

                      // fillColor: Colors.white,
                      labelStyle: TextStyle(
                          color: Colors.grey[400], fontSize: altura * .018),

                      // labelText: 'Correo'
                    ),
                  ),
                ),
                SizedBox(height: altura * 0.014),
                SizedBox(
                  height: altura * .03,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () => {},
                        child: Text(
                          "Olvidó su contraseña?",
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * .018),
                        ),
                      ),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: altura * 0.012,
                ),
                SizedBox(
                  height: altura * .06,
                  width: ancho * .92,
                  child: RaisedButton(
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontSize: altura * .019),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Color(0xff1ba6d2))),
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .155,
                          right: MediaQuery.of(context).size.width * .155,
                          top: MediaQuery.of(context).size.height * .02,
                          bottom: MediaQuery.of(context).size.height * .02),
                      color: Color(0xff1ba6d2),
                      elevation: 0,
                      onPressed: () {
                        //print("USER=> "+usernameController.text.toString()+ passwordController.text.toString());
                        String username = usernameController.text.toString();
                        String password = passwordController.text.toString();

                        if (username != "" && password != "") {
                          if (username == "admin" && password == "admin") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => mainCourses()));
                          } else {
                            _showDialog("Usuario y/o Contraseña incorrecta");
                          }
                        } else {
                          _showDialog(
                              "Ingrese un usuario y/o contraseña válido");
                        }
                      }),
                ),
                SizedBox(
                  height: altura * 0.24,
                ),
                SizedBox(
                  child: GestureDetector(
                    onTap: () {
                      print("CREAR CUENTA");
                    },
                    child: Center(
                      child: Text(
                        "Crear cuenta",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
