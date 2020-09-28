import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String text1 = "Informe seus dados:";
  String text2 = "";
  String text3 = "";
  String text4 = "";

  void resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      text1 = "Informe seus dados:";
      text2 = "";
      text3 = "";
      text4 = "";
    });
  }

  void calcular() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double massa;
      double massa2;
      double quantidade;

      double imc = weight / (height * height);
      if (imc < 18.6) {
        text2 = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
        massa = 18.6 * height * height;
        quantidade = massa - weight;
        massa2 = 24.9 * height * height;
        text3 =
        "Você precisa adquirir ${quantidade.toStringAsPrecision(3)} kg para chegar ao Peso Ideal(IMC entre 18.9 e 24.9).";
        text4 =
        "Para permanecer no Peso Ideal seu peso deve estar entre ${massa.toStringAsPrecision(3)} kg e ${massa2.toStringAsPrecision(3)} kg.";
      } else if (imc < 24.9) {
        text2 = "Peso ideal (${imc.toStringAsPrecision(3)})";
        text3 = "Muito bem, você está no Peso Ideal (IMC entre 18.9 e 24.9).";
        massa = 18.6 * height * height;
        massa2 = 24.9 * height * height;
        text4 =
        "Para permanecer no Peso Ideal seu peso deve estar entre ${massa.toStringAsPrecision(3)} kg e ${massa2.toStringAsPrecision(3)} kg.";
      } else if (imc < 29.9) {
        text2 = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
        massa = 24.9 * height * height;
        quantidade = weight - massa;
        massa2 = 18.6 * height * height;
        text3 =
        "Você precisa perder ${quantidade.toStringAsPrecision(3)} kg para chegar ao Peso Ideal(IMC entre 18.9 e 24.9).";
        text4 =
        "Para permanecer no Peso Ideal seu peso deve estar entre ${massa2.toStringAsPrecision(3)} kg e ${massa.toStringAsPrecision(3)} kg.";
      } else if (imc < 34.9) {
        text2 = "Obesidade grau I (${imc.toStringAsPrecision(3)})";
        massa = 24.9 * height * height;
        quantidade = weight - massa;
        massa2 = 18.6 * height * height;
        text3 =
        "Você precisa perder ${quantidade.toStringAsPrecision(3)} kg para chegar ao Peso Ideal(IMC entre 18.9 e 24.9).";
        text4 =
        "Para permanecer no Peso Ideal seu peso deve estar entre ${massa2.toStringAsPrecision(3)} kg e ${massa.toStringAsPrecision(3)} kg.";
      } else if (imc <= 39.9) {
        text2 = "Obesidade grau II (${imc.toStringAsPrecision(3)})";
        massa = 34.9 * height * height;
        quantidade = weight - massa;
        massa2 = 29.9 * height * height;
        text3 =
        "Você precisa perder ${quantidade.toStringAsPrecision(3)} kg para chegar ao Grau I(IMC entre 29.9 e 34.9).";
        text4 =
        "Para permanecer no Grau I seu peso deve estar entre ${massa2.toStringAsPrecision(3)} kg e ${massa.toStringAsPrecision(3)} kg.";
      } else if (imc > 39.9) {
        text2 = "Obesidade grau III(${imc.toStringAsPrecision(3)})";
        massa = 39.9 * height * height;
        quantidade = weight - massa;
        massa2 = 34.9 * height * height;
        text3 =
        "Você precisa perder ${quantidade.toStringAsPrecision(3)} kg para chegar ao Grau II(IMC entre 34.9 e 39.9).";
        text4 =
        "Para permanecer no grau II seu peso deve estar entre ${massa2.toStringAsPrecision(3)} kg e ${massa.toStringAsPrecision(3)} kg.";
      }
      text1 = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.pink,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Icon(Icons.accessibility_new,
                      size: 120.0, color: Colors.pink),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 10.0),
                  child: Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.pink, fontSize: 20.0),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso (kg):",
                    labelStyle: TextStyle(color: Colors.pink),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pink, fontSize: 20.0),
                  controller: weightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira o seu peso! ";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Altura (cm):",
                    labelStyle: TextStyle(color: Colors.pink),
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.pink, fontSize: 20.0),
                  controller: heightController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira a sua altura! ";
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20, 0, 20.0),
                  child: Text(
                    text2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.pink, fontSize: 17.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                  child: Text(
                    text3,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.pink, fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 20.0),
                  child: Text(
                    text4,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.pink, fontSize: 15.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            return calcular();
                          }
                        },
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.pink,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50.0, bottom: 5.0),
                  child: Text(
                    "By Emanuel Vieira",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 10.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
