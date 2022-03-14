import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  State<Jogo> createState() => _JogoState();

}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  var _contadorVitoria = 0;
  var _contadorDerrotas = 0;

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //verificação
    switch( escolhaApp ){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;

    }

    // validação
    //Usuario ganha
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra"))
    {
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
        this._contadorVitoria += 1;
      });
    }
    //Usuario perde
    else if((escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura"))
    {
      this._contadorDerrotas += 1;
      setState(() {
        this._mensagem = "Você perdeu! :(";

      });

    } // empate
    else {
      setState(() {
        this._mensagem = "Empate! ;)";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            ),
          ),
          Image(image: _imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", width: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", width: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", width: 100,),
              )
              /*

              Image.asset("imagens/pedra.png", width: 100,),
              Image.asset("imagens/papel.png", width: 100,),
              Image.asset("imagens/tesoura.png", width: 100,),
              */
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16),
            child: Text(
              "Contador de Vitorias: ${this._contadorVitoria}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 16),
            child: Text(
              "Contador de Derrotas: ${this._contadorDerrotas}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 2),
            child: Text(
              "Made by: Kaio Antônio 🤓",
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal

              ),
            ),
          ),
        ],
      ),
    );
  }
}
