import 'package:calculadora/main.dart';
import 'package:calculadora/telaExibicaoDados.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TelaInputs extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  final _idadeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF4A90E2),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('lib/assets/balancaIcon.json',
                width: 105.0,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child: TextFormField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Por favor digite seu peso";
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.fitness_center,
                        color: Color(0xFF4A90E2),
                        size: 35.0,
                      ),
                      hintText: "Digite seu peso",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child: TextFormField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if(value == null || value.isEmpty) {
                        return "Por favor digite seu altura";
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.straighten,
                        color: Color(0xFF4A90E2),
                        size: 35.0,
                      ),
                      hintText: "Digite sua altura",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                      ),
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      filled: true,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 25.0),
                child: SizedBox(
                  width: 300.0,
                  height: 55.0,
                  child: TextFormField(
                    controller: _idadeController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      RegExp validacaoValoresRegex = RegExp('(\d*,\d*)|(\d*.\d*)|(\d*)');
                      if(value == null || value.isEmpty || !validacaoValoresRegex.hasMatch(value)) {
                        return "Por favor digite sua idade";
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Color(0xFF4A90E2),
                        size: 35.0,
                      ),
                      hintText: "Digite sua idade",
                      hintStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()) {
                      String validarPeso = _pesoController.text;
                      String validarAltura = _alturaController.text;
                      String validarIdade = _idadeController.text;

                      if(validarPeso.contains(',')) {
                        int indexPeso = validarPeso.indexOf(',');
                        validarPeso = validarPeso.replaceFirst(',', '.', indexPeso);
                      }

                      if(validarAltura.contains(',')) {
                        int indexAltura = validarAltura.indexOf(',');
                        validarAltura = validarAltura.replaceFirst(',', '.', indexAltura);
                      }

                      if(validarIdade.contains(',')) {
                        int indexIdade = validarIdade.indexOf(',');
                        validarIdade = validarIdade.replaceFirst(',', '.', indexIdade);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TelaExibicaoDados(
                                  peso: double.parse(validarPeso),
                                  altura: double.parse(validarAltura),
                                  idade: double.parse(validarIdade)
                              )
                          )
                      );
                    }
                  },
                  child: const Text("Calcular")),
            ],
          ),
        ),
      ),
    );
  }
}