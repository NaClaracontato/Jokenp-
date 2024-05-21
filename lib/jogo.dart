import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var imagemApp = const AssetImage('assets/images/padrao.png');
  var mensagem = 'Escolha uma opção abaixo:';

  void opcaoSelecionada(String escolhaUsuario) {
    var opcoes = [
      'pedra',
      'papel',
      'tesoura',
    ];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          imagemApp = const AssetImage('assets/images/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          imagemApp = const AssetImage('assets/images/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          imagemApp = const AssetImage('assets/images/tesoura.png');
        });
        break;
    }

    //Validação do ganhador
    //Usuario ganhador
    if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUsuario == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUsuario == 'papel' && escolhaApp == 'pedra')) {
      setState(() {
        mensagem = 'Parabéns!!! Você ganhou :)';
      });
      //App ganhador
    } else if ((escolhaApp == 'pedra' && escolhaUsuario == 'tesoura') ||
        (escolhaApp == 'tesoura' && escolhaUsuario == 'papel') ||
        (escolhaApp == 'papel' && escolhaUsuario == 'pedra')) {
      setState(() {
        mensagem = 'Você perdeu :(';
      });
    } else {
      setState(() {
        mensagem = 'Empatamos ;)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JokenPo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              'Escolha do App:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: imagemApp,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 16),
            child: Text(
              mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => opcaoSelecionada('pedra'),
                child: Image.asset('assets/images/pedra.png', height: 100),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada('papel'),
                child: Image.asset('assets/images/papel.png', height: 100),
              ),
              GestureDetector(
                onTap: () => opcaoSelecionada('tesoura'),
                child: Image.asset('assets/images/tesoura.png', height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
