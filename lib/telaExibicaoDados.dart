import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TelaExibicaoDados extends StatelessWidget {

  const TelaExibicaoDados({super.key, required this.peso, required this.altura, required this.idade});

  final double peso;
  final double altura;
  final double idade;

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final ViewportBuilder viewportBuilder;
    double imc = _calculoIMC(peso, altura, idade);
    double percentualGordura = _calculoPercentualGordura(peso, altura, idade, imc);
    double percentualAguaCorporal = _calculoPercentualAguaCorporal(peso, altura, idade);
    double gorduraVisceral = _calculoGorduraVisceral(imc);
    double pesoOssos = _calculoPesoOssos(peso, altura, idade);
    double proteinaCorporal = _calculoProteinaCorporal(peso, altura, idade);
    double lbm = _calculoLBM(peso, altura, idade);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportsContraints) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportsContraints.maxHeight,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0, bottom: 150.0),
                        child: SizedBox(
                          height: 300.0,
                          child: SfRadialGauge(
                            title: const GaugeTitle(
                              text: "Índice de Massa Corporal",
                              textStyle: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4000,
                            backgroundColor: Colors.white38,
                            axes: [
                              RadialAxis(
                                axisLineStyle: AxisLineStyle(
                                  thickness: 20.0,
                                ),
                                showLabels: true,
                                minimum: 0,
                                maximum: 40,
                                ranges: [
                                  GaugeRange(
                                    startValue: 0,
                                    endValue: 18.5,
                                    color: Colors.green,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 18.6,
                                    endValue: 24.9,
                                    color: Colors.amberAccent,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 25.0,
                                    endValue: 29.9,
                                    color: Colors.deepOrangeAccent,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                    label: "",
                                  ),
                                  GaugeRange(
                                    startValue: 30,
                                    endValue: 34.9,
                                    color: Colors.deepOrange,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 35.0,
                                    endValue: 40.0,
                                    color: Colors.deepOrange,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 40,
                                    endValue: 60,
                                    color: Colors.red,
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(value: imc),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(imc.toStringAsPrecision(3),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    angle: 90.0,
                                    positionFactor: 0.5,
                                  ),
                                  const GaugeAnnotation(
                                    widget: Card(
                                      color: Color(0xFFFFF38C),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text("Abaixo do peso",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment: GaugeAlignment.far,
                                    horizontalAlignment: GaugeAlignment.center,
                                    positionFactor: 1.20,
                                    angle: 90.0,
                                  ),
                                  const GaugeAnnotation(
                                    widget: Card(
                                      color: Color(0xFF8CC0DE),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 24.0),
                                        child: Text("Peso ideal",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment: GaugeAlignment.far,
                                    horizontalAlignment: GaugeAlignment.center,
                                    positionFactor: 1.47,
                                    angle: 90.0,
                                  ),
                                  const GaugeAnnotation(
                                    widget: Card(
                                      color: Color(0xFFF37878),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text("Obesidade III",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment: GaugeAlignment.far,
                                    horizontalAlignment: GaugeAlignment.center,
                                    positionFactor: 1.77,
                                    angle: 90.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Percentual de Gordura",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),

                      Container(
                        child: SizedBox(
                          width: 280.0,
                          child: SfLinearGauge(
                            barPointers: [
                              LinearBarPointer(value: percentualGordura, color: Colors.black,),
                            ],
                            markerPointers: [
                              LinearShapePointer(value: percentualGordura)
                            ],
                            minimum: 0.0,
                            maximum: 40.0,
                            ranges: const [
                              LinearGaugeRange(
                                startValue: 10,
                                endValue: 13,
                                color: Color(0xFFFFF38C),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 13,
                                endValue: 20,
                                color: Color(0xFF8CC0DE),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 20,
                                endValue: 24,
                                color: Color(0xFF1C6DD0),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 24,
                                endValue: 31,
                                color: Color(0xFFFF8C8C),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 31,
                                color: Color(0xFFFD5D5D),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        child: Column(
                          children: const [
                            Card(
                              color: Color(0xFFFFF38C),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 26.0),
                                child: Text("Essencial",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFF8CC0DE),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 22.0),
                                child: Text("Nível atleta",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFF1C6DD0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 26.0),
                                child: Text("Boa forma",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFFFF8C8C),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 23.0),
                                child: Text("Nível médio",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFFFD5D5D),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 26.0),
                                child: Text("Obesidade",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 20.0, bottom: 60.0),
                        child: SizedBox(
                          height: 300.0,
                          child: SfRadialGauge(
                            title: const GaugeTitle(
                              text: "Percentual de Água Corporal",
                              textStyle: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            enableLoadingAnimation: true,
                            animationDuration: 4000,
                            backgroundColor: Colors.white38,
                            axes: [
                              RadialAxis(
                                startAngle: 180,
                                endAngle: 360,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 20.0,
                                ),
                                showLabels: true,
                                minimum: 40,
                                maximum: 70,
                                ranges: [
                                  GaugeRange(
                                    startValue: 40,
                                    endValue: 45,
                                    color: Color(0xFFF37878),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 45,
                                    endValue: 50,
                                    color: Color(0xFF97DBAE),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 50,
                                    endValue: 55,
                                    color: Color(0xFF97DBAE),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 50,
                                    endValue: 60,
                                    color: Color(0xFF97DBAE),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 60,
                                    endValue: 65,
                                    color: Color(0xFFF37878),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                  GaugeRange(
                                    startValue: 65,
                                    endValue: 70,
                                    color: Color(0xFFF37878),
                                    startWidth: 20.0,
                                    endWidth: 20.0,
                                  ),
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(value: percentualAguaCorporal),
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Text(percentualAguaCorporal.toStringAsPrecision(3),
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    angle: 90.0,
                                    positionFactor: 0.5,
                                  ),
                                  const GaugeAnnotation(
                                    widget: Card(
                                      color: Color(0xFF97DBAE),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0, horizontal: 33.0),
                                        child: Text("Ideal",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment: GaugeAlignment.far,
                                    horizontalAlignment: GaugeAlignment.center,
                                    positionFactor: 0.95,
                                    angle: 90.0,
                                  ),
                                  const GaugeAnnotation(
                                    widget: Card(
                                      color: Color(0xFFF37878),
                                      child: Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text("Fora do ideal",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.5
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalAlignment: GaugeAlignment.far,
                                    horizontalAlignment: GaugeAlignment.center,
                                    positionFactor: 1.25,
                                    angle: 90.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        child: const Text(
                          "Gordura Visceral",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),

                      Container(
                        child: SizedBox(
                          width: 280.0,
                          child: SfLinearGauge(
                            barPointers: [
                              LinearBarPointer(value: gorduraVisceral, color: Colors.black,),
                            ],
                            markerPointers: [
                              LinearShapePointer(value: gorduraVisceral)
                            ],
                            minimum: 0.0,
                            maximum: 30.0,
                            ranges: const [
                              LinearGaugeRange(
                                startValue: 0,
                                endValue: 9,
                                color: Color(0xFF97DBAE),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 9,
                                endValue: 14,
                                color: Color(0xFFFFF38C),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                              LinearGaugeRange(
                                startValue: 14,
                                endValue: 30,
                                color: Color(0xFFFD5D5D),
                                startWidth: 12.0,
                                endWidth: 12.0,
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 15.0, bottom: 45.0),
                        child: Column(
                          children: const [
                            Card(
                              color: Color(0xFF97DBAE),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 26.0),
                                child: Text("Essencial",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFFFFF38C),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 22.0),
                                child: Text("Nível atleta",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),

                            Card(
                              color: Color(0xFFFD5D5D),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 26.0),
                                child: Text("Boa forma",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.5
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: const Text(
                          "Peso dos Ossos",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(bottom: 45.0),
                        child: Card(
                          color: Color(0xFF8CC0DE),
                          shadowColor: Colors.black,
                          elevation: 10.0,
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: 250.0,
                            height: 110.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pesoOssos.toStringAsPrecision(2) + "%",
                                  style: TextStyle(
                                    fontSize: 45.0,
                                    color: Colors.black54,
                                  ),
                                ),

                                const Text(
                                  "da massa corporal",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        child: const Text(
                          "Proteína Corporal",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Card(
                        color: Color(0xFF97DBAE),
                        shadowColor: Colors.black,
                        elevation: 10.0,
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          alignment: AlignmentDirectional.center,
                          width: 250.0,
                          height: 110.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                proteinaCorporal.toStringAsPrecision(2) + "%",
                                style: TextStyle(
                                  fontSize: 45.0,
                                  color: Colors.black54,
                                ),
                              ),

                              const Text(
                                "da massa corporal",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
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
    );
  }

  double _calculoIMC(peso, altura, idade) {
    double resultadoIMC = 0.0;

    resultadoIMC = peso/(altura*altura);

    return resultadoIMC;
  }

  double _calculoPercentualGordura(peso, altura, idade, imc) {
    double resultadoPercentualGordura = 0.0;

    resultadoPercentualGordura = (1.39 * imc) + (0.16 * idade) - (10.34 * 1) - 9;

    return resultadoPercentualGordura;
  }

  double _calculoPercentualAguaCorporal(peso, altura, idade) {
    double resultadoPercentualAguaCorporal = 0.0;

    resultadoPercentualAguaCorporal = 2.447 - 0.09156 * idade + 0.1074 * (altura * 100) + 0.3362 * peso;

    resultadoPercentualAguaCorporal = (resultadoPercentualAguaCorporal * 100)/peso;

    return resultadoPercentualAguaCorporal;
  }

  double _calculoGorduraVisceral(imc) {

    double resultadoGorduraVisceral = 0.0;

    resultadoGorduraVisceral = 2.447 - 0.09156 * idade + 0.1074 * (altura * 100) + 0.3362 * peso;

    resultadoGorduraVisceral = 31.888 + (4.044 * imc);

    return resultadoGorduraVisceral;
  }

  double _calculoPesoOssos(peso, altura, idade) {

    double resultadoPesoOssos = 0.0;

    resultadoPesoOssos = 0.23 * peso + (0.15 * (altura * 100)) - 0.058 * idade - 0.0005 * (idade * idade) - 13.2;

    resultadoPesoOssos = (resultadoPesoOssos * 100)/peso;

    return resultadoPesoOssos;
  }

  double _calculoProteinaCorporal(peso, altura, idade) {

    double resultadoProteinaCorporal = 0.0;

    double aguaCorporal = 2.447 - 0.09156 * idade + 0.1074 * (altura * 100) + 0.3362 * peso;

    resultadoProteinaCorporal = 0.335 * aguaCorporal - 2.53;

    resultadoProteinaCorporal = (resultadoProteinaCorporal * 100)/peso;

    return resultadoProteinaCorporal;
  }

  double _calculoLBM(peso, altura, idade) {

    double resultadoLBM = 0.0;

    resultadoLBM =   0.407 * peso + 0.267 * altura - 19.2;

    return resultadoLBM;
  }
}