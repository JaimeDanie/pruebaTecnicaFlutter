class CourseModel {
  String nombreCurso;
  String description;
  String descriptionShort;
  double calificacion;
  double precio;
  int numEstudiates;
  String image;
  CourseModel(
      {this.nombreCurso,
      this.description,
      this.calificacion,
      this.descriptionShort,
      this.image,
      this.numEstudiates,
      this.precio});
}

class listCourses {
  List<CourseModel> lcourses;

  listCourses() {
    this.lcourses = new List();
    cargarCursos();
  }

  List<CourseModel> obtenerCursos() {
    return this.lcourses;
  }

  cargarCursos() async {
    CourseModel curso1 = CourseModel(
        calificacion: 5,
        description:
            "Java es un lenguaje de programación orientado a objetos que se incorporó al ámbito de la informática en los años noventa. La idea de Java es que pueda realizarse programas con la posibilidad de ejecutarse en cualquier contexto, en cualquier ambiente, siendo así su portabilidad uno de sus principales logros. Fue desarrollado por Sun Microsystems, posteriormente adquirido por Oracle. En la actualidad puede utilizarse de modo gratuito, pudiéndose conseguir sin problemas un paquete para desarrolladores que oriente la actividad de programar en este lenguaje. Puede ser modificado por cualquiera, circunstancia que lo convierte en lo que comúnmente se denomina código abierto," +
                "Cuando se programa con un lenguaje, se utiliza un tipo de código que la máquina es incapaz de reconocer. Es por ello que se requiere de un proceso de compilación, esto es, de “traducir” el lenguaje utilizado para que la máquina sea capaz de reconocerlo y procesarlo. Cada vez que un código requiere ser ejecutado en un ambiente distinto, deberá compilarse nuevamente. Con el desarrollo de Java se intentó evitar este tipo de circunstancia, haciendo que el código corriera en cualquier ambiente. El modo en que se logró este objetivo es desarrollando una máquina virtual que ejecutase el código compilado; esto significa que la “traducción” ya no se hace para que sea comprendida por un determinado sistema operativo; se hace para que la interprete la “máquina virtual”, que puede correr en cualquier sistema operativo. De esta manera, solo es necesario realizar una compilación, que podrá ser utilizada en cualquier entorno que tenga instalada la máquina virtual java.",
        descriptionShort: "Curso Java SE, desde Cero.",
        image: "java.png",
        nombreCurso: "Programación Java",
        numEstudiates: 40,
        precio: 20000);

    CourseModel curso2 = CourseModel(
        calificacion: 5,
        description:
            "PHP son las siglas en inglés de “Hypertext Pre-Processor” que al traducirlo al español pierde un poco el sentido, mejor lo analizamos y encontramos que significa “Lenguaje de Programación Interpretado”. Este lenguaje es al que le debemos la visualización de contenido dinámico en las páginas web. Todo el código PHP es invisible para el usuario, porque todas las interacciones que se desarrollan en este lenguaje son por completo transformadas para que se puedan ver imágenes, variedad de multimedia y los formatos con los que somos capaces de interactuar añadiendo o descargando información de ellos." +
                "La internet ofrece una variedad de formas de comunicación que muchas de ellas no conocemos. Incluso cuando tenemos frente a nosotros un formulario, este lenguaje que estamos utilizando está comunicándose con Ud., solicitando que Ud. proporcione información a través de un código PHP. Fue creado en el año 1994, bajo la premisa de ser un código libre destinado a la comunidad desarrolladora de programas que más adelante, en el siguiente siglo, alimentarían a la red de internet. Las interfaces gráficas en las que se maneja son denominadas bibliotecas Qt y GTK+, con esto, los lenguajes de programación estructurada más comunes como el C y Perl pueden desarrollar aplicaciones y programas para la red sencillos de interpretar y compatibles con cualquier tipo de servidor y sistema operativo vigente aún en el mercado. PHP interactúa fácilmente con archivos de toda clase, desde los más básicos como .docx, .PDF, .JPG, hasta los Flash que son animaciones cargadas en la red. PHP es el lenguaje de programación de aplicaciones interactivas más fácil de usar y por más de 20 años no ha podido ser reemplazado por las variantes que ha propuesto Microsoft por ejemplo.",
        descriptionShort: "Curso PHP 7, desde Cero.",
        image: "php.png",
        nombreCurso: "Programación PHP",
        numEstudiates: 40,
        precio: 15000);

    CourseModel curso3 = CourseModel(
        calificacion: 5,
        description: "Bienvenido a esta primera lección de nuestro curso de Python en español!. Hablemos sobre el lenguaje y sus principales características las cuales lo diferencian de otros. Haciéndolo un lenguaje muy atractivo para quienes comienzan a programar y permitiendo un amplio desarrollo de aplicaciones de manera muy sencilla." +
            "La internet ofrece una variedad de formas de comunicación que muchas de ellas no conocemos. Incluso cuando tenemos frente a nosotros un formulario, este lenguaje que estamos utilizando está comunicándose con Ud., solicitando que Ud. proporcione información a través de un código PHP. Fue creado en el año 1994, bajo la premisa de ser un código libre destinado a la comunidad desarrolladora de programas que más adelante, en el siguiente siglo, alimentarían a la red de internet. Las interfaces gráficas en las que se maneja son denominadas bibliotecas Qt y GTK+, con esto, los lenguajes de programación estructurada más comunes como el C y Perl pueden desarrollar aplicaciones y programas para la red sencillos de interpretar y compatibles con cualquier tipo de servidor y sistema operativo vigente aún en el mercado. PHP interactúa fácilmente con archivos de toda clase, desde los más básicos como .docx, .PDF, .JPG, hasta los Flash que son animaciones cargadas en la red. PHP es el lenguaje de programación de aplicaciones interactivas más fácil de usar y por más de 20 años no ha podido ser reemplazado por las variantes que ha propuesto Microsoft por ejemplo. Si no comprendes bien estos conceptos y no tienes una mínima base de programación no te preocupes. Aprenderás a programar igual y todo esto lo vas a entender a medida que avancemos en el curso de Python, ya lo verás!!" +
            "Normalmente los lenguajes de programación se pueden agrupar en Interpretados y Compilados según la forma en la que son traducidos. Los lenguajes se inventaron para facilitar al programador el desarrollo aplicaciones, imagina que nuestro computador trabaja en código binario y sería muy difícil programar todo en unos y ceros, además de que nos tardaríamos siglos y nadie quiere eso!!. Por eso cuando nosotros escribimos un código en realidad lo que estamos haciendo es hablar un lenguaje más fácil de comprender para nosotros y que luego será traducido a lenguaje de máquina que es lo que puede entender el procesador. Entonces, cómo se realiza esta “traducción” es lo que los agrupa en Interpretados o Compilados. Los lenguajes Compilados son aquellos en los que el código del programador es traducido por completo de una sola vez mediante un proceso llamado “Compilado”  para ser ejecutado por un sistema predeterminado. Entre los más comunes encontramos “C”, “C++”, Java, etc.Y los lenguajes Interpretados son aquellos en los que el código del programador es traducido mediante un intérprete a medida que es necesario. Entre los más comunes encontramos “Python“, “Ruby”, “Javascript”, etc. El que Python sea interpretado nos presenta ventajas: Al ser interpretado no necesitamos compilar ahorrándonos mucho tiempo en el desarrollo y prueba de una aplicación."
                "Nuestro código fuente puede ser ejecutado en cualquier software siempre y cuando este disponga del intérprete (Windows, Linux, Mac, Android, Web).",
        descriptionShort: "Curso Python, desde Cero.",
        image: "python.png",
        nombreCurso: "Programación Python",
        numEstudiates: 40,
        precio: 18000);

    CourseModel curso4 = CourseModel(
        calificacion: 5,
        description:
            "C#(pronunciado si sharp en inglés) es un lenguaje de programación multiparadigma desarrollado y estandarizado por la empresa Microsoft como parte de su plataforma .NET, que después fue aprobado como un estándar por la ECMA (ECMA-334) e ISO (ISO/IEC 23270). C# es uno de los lenguajes de programación diseñados para la infraestructura de lenguaje común.Su sintaxis básica deriva de C/C++ y utiliza el modelo de objetos de la plataforma .NET, similar al de Java, aunque incluye mejoras derivadas de otros lenguajes. El nombre C Sharp fue inspirado por el signo ♯, el cual se lee como sharp en inglés para notación musical. Es un juego de palabras, pues C# significa, musicalmente hablando, do sostenido, donde el símbolo # indica que una nota (en este caso do, representada por C) debe ser un semitono más alta. Esto es una metáfora de la superioridad de C# sobre su antecesor C++ y a su vez hace alusión a la misma metáfora que se ideó para dar nombre a C++.1​ Además, el símbolo # puede ser imaginado como la unión de cuatro símbolos +, continuando así con el sentido de progresión de los lenguajes C." +
                "Aunque C# forma parte de la plataforma .NET, esta es una API, mientras que C# es un lenguaje de programación independiente diseñado para generar programas sobre dicha plataforma. Ya existe un compilador implementado que provee el marco Mono - DotGNU, el cual genera programas para distintas plataformas como Windows Microsoft, Unix, Android, iOS, Windows Phone, Mac OS y GNU/Linux.",
        descriptionShort: "Curso C#, ASP.NET",
        image: "cSharp.png",
        nombreCurso: "Programación C#",
        numEstudiates: 40,
        precio: 19000);

    CourseModel curso5 = CourseModel(
        calificacion: 5,
        description:
            "C#(pronunciado si sharp en inglés) es un lenguaje de programación multiparadigma desarrollado y estandarizado por la empresa Microsoft como parte de su plataforma .NET, que después fue aprobado como un estándar por la ECMA (ECMA-334) e ISO (ISO/IEC 23270). C# es uno de los lenguajes de programación diseñados para la infraestructura de lenguaje común.Su sintaxis básica deriva de C/C++ y utiliza el modelo de objetos de la plataforma .NET, similar al de Java, aunque incluye mejoras derivadas de otros lenguajes. El nombre C Sharp fue inspirado por el signo ♯, el cual se lee como sharp en inglés para notación musical. Es un juego de palabras, pues C# significa, musicalmente hablando, do sostenido, donde el símbolo # indica que una nota (en este caso do, representada por C) debe ser un semitono más alta. Esto es una metáfora de la superioridad de C# sobre su antecesor C++ y a su vez hace alusión a la misma metáfora que se ideó para dar nombre a C++.1​ Además, el símbolo # puede ser imaginado como la unión de cuatro símbolos +, continuando así con el sentido de progresión de los lenguajes C." +
                "Aunque C# forma parte de la plataforma .NET, esta es una API, mientras que C# es un lenguaje de programación independiente diseñado para generar programas sobre dicha plataforma. Ya existe un compilador implementado que provee el marco Mono - DotGNU, el cual genera programas para distintas plataformas como Windows Microsoft, Unix, Android, iOS, Windows Phone, Mac OS y GNU/Linux.",
        descriptionShort: "Curso GO, desde cero",
        image: "go.png",
        nombreCurso: "Programación Go",
        numEstudiates: 40,
        precio: 17500);

    lcourses.add(curso1);
    lcourses.add(curso2);
    lcourses.add(curso3);
    lcourses.add(curso4);
    lcourses.add(curso5);
    //print("TOTAL CURSOS=> " + lcourses.length.toString());
  }
}
