import 'package:calculadora/telaInputs.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TelaInicial extends StatefulWidget {
  State<TelaInicial> createState() => AnimacaoLogoState();
}

class AnimacaoLogoState extends State<TelaInicial> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  void _animacaoLogoState() {
    setState(() {

    });
  }

  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(
          seconds: 2,
        ),
        vsync: this
    );

    animation = controller..addListener(() {
      if(animation.isCompleted) {
        SegundaTela(context);
      }
    });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 3.0,
        child: Lottie.asset('lib/assets/logo.json',
          controller: animation,
          animate: true,
        ),
      ),
    );
  }
}

Future SegundaTela(BuildContext context) async {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TelaInputs()));
}