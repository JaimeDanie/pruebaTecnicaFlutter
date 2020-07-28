import 'dart:async';
import 'package:prueba_tecnica_courses/data/models/coursesModel.dart';
import 'package:rxdart/rxdart.dart';

class blocCourses {
  List<CourseModel> _lcursos = new List();
  BehaviorSubject<List<CourseModel>> _listCursos =
      BehaviorSubject<List<CourseModel>>();
  final _filterCurso = StreamController<String>();

  StreamSink<String> get filtercursos => _filterCurso.sink;

  Stream<List<CourseModel>> get cursosList => _listCursos.stream;
  StreamSink<List<CourseModel>> get cursosListSink => _listCursos.sink;

  blocCourses() {
    init();
  }

  init() async {
    listCourses lc = new listCourses();
    _lcursos.addAll(lc.obtenerCursos());
    await _listCursos.sink.add(_lcursos);
    _filterCurso.stream.listen(_filtrarCursos);
  }

  _filtrarCursos(String valor) {
    List<CourseModel> ls = new List();
    if (valor != "") {
      for (CourseModel c in _lcursos) {
        if (c.nombreCurso.toLowerCase().contains(valor.trim().toLowerCase())) {
          ls.add(c);
        }
      }
    } else {
      ls.addAll(_lcursos);
    }

    _listCursos.sink.add(ls);
  }
}

final listaCursos = blocCourses();
