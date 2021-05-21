import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gatovidapp/partidas/card.dart';

class Rules extends StatefulWidget {
  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF64DD17),
        title: const Text(
          'Ayuda',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.05), BlendMode.dstATop),
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text("Estructura del tablero",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.06)),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.01),
                  child: Text(
                      "En la parte más inferior aparece tu mano, es decir,"
                      " las cartas que tienes en todo momento para poder jugar."
                      "\n\n"
                      "En mitad de pantalla aparecen 3 componentes:\n"
                      "●  Un botón con el que puedes pasar el turno\n"
                      "● El cronómetro, que cuando sea tu turno se activará "
                      "y podrás ver el tiempo de juego restante en tu turno.\n"
                      "● Un cuadro al que puedes descartar cartas de tu mano.\n\n"
                      "Entre estos componentes y tu mano, se encuentra el espacio "
                      "para ir colocando las cartas de tu cuerpo.\n\n"
                      "Entre los botones superiores y los componentes mencionados "
                      "se encuentran los cuerpos de tus oponentes. Puedes "
                      "colocar en tu turno cartas sobre estos cuerpos.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.04,
                      bottom: screenHeight * 0.005),
                  child: Text("Objetivo del juego",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "Sé el primer jugador en completar tu cuerpo. "
                      "Un cuerpo lo forman 4 órganos, uno de cada color. "
                      "Si logras reunir sobre la mesa, frente a ti, "
                      "tus 4 órganos diferentes sanos, ¡habrás ganado la partida!",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.04,
                      bottom: screenHeight * 0.005),
                  child: Text("Mecánica del juego",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "Cada jugador debe tener siempre al comienzo de su turno 3 cartas en su mano y tan "
                      "solo podrá realizar una acción por turno. Después de haber actuado, recibirá "
                      "cartas del mazo para volver a tener su mano completa. "
                      "Juega los distintos tipos de carta, colocándolas en el espacio del cuerpo para "
                      "construirlo, o sobre las cartas de tus rivales para evitar que estos lo "
                      "logren antes que tú.\n\n"
                      "Algunas cartas pueden obligarte a descartar o cambiar tus órganos, tus vacunas "
                      "o incluso tu mano. Elabora tu estrategia para ser el primero en formar tu cuerpo "
                      "completo.\n"
                      "Permanece atento a las jugadas de los demás, porque tendrás que evitar que el "
                      "resto de jugadores terminen su cuerpo antes que tú.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.04,
                      bottom: screenHeight * 0.005),
                  child: Text("Fases del juego",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "●  FASE 1: Jugar o descartar. "
                      "Jugar una única carta de tu mano o descarta las cartas que se desee.\n\n"
                      "●  FASE 2: Robar. "
                      "Tu mano se completará automáticamente cuando termine tu turno.\n\n"
                      "●  FASE 3: Pasar. "
                      "Pasa el turno al jugador de tu derecha.",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.04,
                      bottom: screenHeight * 0.005),
                  child: Text("Tipos de carta",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.06)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Órganos",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 0,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 1,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 2,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 3,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 4,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "Usa las cartas de virus para destruir los órganos y medicinas de tus rivales. Los virus sólo tienen "
                      "efecto sobre órganos y medicinas de su mismo color.\n\n"
                      "El órgano multicolor actúa como un comodín para ayudarte a completar tu cuerpo y cuenta como "
                      "órgano a todos sus efectos. Puede vacunarse con una medicina de cualquier color, pero también "
                      "puede ser infectado por un virus de cualquier color.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Virus",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 5,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 6,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 7,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 8,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 9,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "● INFECTAR: Coloca una carta de virus sobre un órgano libre de su color para infectarlo. "
                      "No podrás completar tu cuerpo si alguno de tus órganos está infectado por un virus.\n\n"
                      "● EXTIRPAR: Destruye un órgano infectado. Coloca un segundo virus sobre un órgano ya "
                      "infectado: Este órgano es destruido y las tres cartas van a parar a los descartes.\n\n"
                      "● DESTRUIR VACUNA: Destruye una vacuna. Elimina una carta de medicina que se encuentre "
                      "sobre un órgano. Envía el virus y la medicina a los descartes.\n\n"
                      "● VIRUS MULTICOLOR: Este virus comodín puede infectar un órgano o destruir una vacuna de "
                      "cualquier color. Sin embargo, también puede ser curado por medicinas de cualquier color.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Medicinas",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 10,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 11,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 12,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 13,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 14,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Text(
                      "● CURAR: Destruye un virus. Utiliza una carta de medicina para descartar un virus de su mismo "
                      "color que se encuentre sobre un órgano.\n\n"
                      "● VACUNAR: Protege un órgano. Coloca una medicina sobre un órgano libre de su mismo color. "
                      "Ahora tus rivales necesitan dos virus para infectar tu órgano.\n\n"
                      "● INMUNIZAR: Coloca una segunda medicina sobre un órgano. Este queda protegido para "
                      "siempre contra el ataque de cualquier virus y no podrá ser destruido ni afectado por cartas de "
                      "tratamiento.\n\n"
                      "● MEDICINAS MULTICOLOR: Estas medicinas son comodines. Utilízalas para curar virus o "
                      "vacunar órganos de cualquier color. Del mismo modo, pueden ser destruidas por virus de "
                      "cualquier color.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Tratamientos",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.05)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04,
                      left: screenWidth * 0.04,
                      bottom: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 15,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 16,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 17,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 18,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      CardTemplate(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.17,
                        numCard: 19,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: screenWidth * 0.04, left: screenWidth * 0.04),
                  child: Text(
                      "Las cartas de tratamiento pueden alterar el juego para ayudarte a ganar. Utilízalas en tu beneficio o "
                      "para evitar que tus rivales completen su cuerpo antes que tú.\n\n"
                      "En orden de izquierda a derecha según aparece en las imágenes, realizan las siguientes acciones:\n\n"
                      "● TRASPLANTE: Intercambia un órgano por otro entre dos jugadores cualesquiera. No importa "
                      "si el color de estos órganos es diferente, ni si están sanos, infectados o vacunados. "
                      "Sencillamente el jugador cambia el órgano escogido por otro, siempre y cuando ninguno de "
                      "los dos jugadores tenga dos órganos del mismo color ni éstos estén inmunizados.\n\n"
                      "Para realizar esta acción primero debes arrastrar la carta al órgano del primer jugador"
                      "con el que quieres intercambiar y lo mismo con el segundo que participa en el transplante. \n\n"
                      "● LADRÓN DE ÓRGANOS: Roba un órgano de otro jugador y añádelo a tu cuerpo. Puedes robar "
                      "órganos sanos, vacunados o infectados, pero no inmunes. Recuerda que no puedes tener dos "
                      "órganos del mismo color\n\n"
                      "Para realizar esta acción arrastra la carta de tratamiento al órgano que quieras robar.\n\n"
                      "● CONTAGIO: Contagia con tantos virus como puedas de tus órganos infectados a los órganos de los "
                      "demás jugadores.\n\n"
                      "Para realizar esta acción arrastra la carta de tratamiento a cualquier cuerpo y se realizará "
                      "el contagio de manera aleatoria.\n\n"
                      "● GUANTE DE LÁTEX: Todos los jugadores, excepto el que utiliza el guante, descartan su mano. "
                      "Su mano será reestablecida de nuevo con cartas nuevas.\n\n"
                      "Para realizar esta acción arrastra la carta de tratamiento a cualquier cuerpo.\n\n"
                      "● ERROR MÉDICO: Intercambia todo tu cuerpo por el de otro jugador, incluyendo órganos, "
                      "virus y vacunas. No importa el número de cartas que cada uno tenga. Cuando usas "
                      "esta carta, los órganos inmunizados también son intercambiados.\n\n"
                      "Para realizar esta acción arrastra la carta de tratamiento al cuerpo del jugador "
                      "con el que quieras intercambiar el cuerpo.\n\n",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: screenWidth * 0.04)),
                ),
                SizedBox(height: screenHeight * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
