import 'package:flutter/material.dart';
import 'package:notif_project/_comum/minhas_cores.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
bool queroEntrar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
              MinhasCores.azulTopoGradiente,
              MinhasCores.azulBaixoGradiente,
            ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: Image.asset("assets/logo.png", height: 128)),
                  const Text(
                    "Notify App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(decoration: const InputDecoration(
                    label: Text("E-mail")),
                  ),
                  TextFormField(decoration: const InputDecoration(
                    label: Text("Senha")),
                    obscureText: true,
                  ),
                  Visibility(
                    visible: !queroEntrar,
                    child: Column(
                      children: [
                        TextFormField(decoration: const InputDecoration(
                        label: Text("Confirme Senha")),
                        obscureText: true,
                        ),
                        TextFormField(decoration: const InputDecoration(
                        label: Text("Nome")),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: Text((queroEntrar)? "Entrar" : "Cadastrar")
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        queroEntrar = !queroEntrar;
                      });
                    }, 
                    child: const Text("Ainda não tem uma conta? Cadastre-se")
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}