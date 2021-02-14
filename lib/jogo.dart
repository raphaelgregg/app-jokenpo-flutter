import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imageApp = AssetImage("images/padrao.png");
  var _message = "Escolha uma opção abaixo";

  void _opcaoselecionada(String escolhaUsuario) {
    var opcoes = ["papel", "pedra", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do usuário: " + escolhaUsuario);

    // Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    // Validação do ganhador
    //Usuário ganhador
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._message = "Você ganhou!";
      });

      // App Ganhador
    } else if ((escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura")) {
      setState(() {
        this._message = "Você Perdeu!";
      });
    } else {
      setState(() {
        this._message = "Você Empatou!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenPo")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // text
          // image
          // text resultado
          // linha 3 images
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: this._imageApp),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoselecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoselecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoselecionada("terousa"),
                child: Image.asset(
                  "images/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
