import 'package:flutter/material.dart';
import 'package:notif_project/_comum/minhas_cores.dart';
import 'package:notif_project/componentes/decoracao_campo_autenticacao.dart';
import 'package:notif_project/servicos/autenticacao_servico.dart';
import 'package:validatorless/validatorless.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});
  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailConroller = TextEditingController();
  TextEditingController _senhaConroller = TextEditingController();
  TextEditingController _nomeConroller = TextEditingController();

  AutenticacaoServico _autenServico = AutenticacaoServico();

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
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: Image.asset("assets/logo.png", height: 128)),
                      const Text(
                        "Notify",
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
                      TextFormField(
                        controller: _emailConroller,
                        decoration: getAuthenticationInputDecoration("E-mail"),
                        validator: Validatorless.multiple([
                          Validatorless.email('Este não é um email valido'),
                          Validatorless.required('Este campo é obrigatorio')
                          ]),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaConroller,
                        decoration: getAuthenticationInputDecoration("Senha"),
                        obscureText: true,
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nomeConroller,
                              decoration: getAuthenticationInputDecoration("Nome"),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: (){
                          botaoPrincipalClicado();
                        }, 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MinhasCores.azulTopoGradiente,
                        ),
                        child: Text((queroEntrar)? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        }, 
                        child: const Text(
                          "Ainda não tem uma conta? Cadastre-se", 
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  botaoPrincipalClicado(){
    String nome = _nomeConroller.text;
    String email = _emailConroller.text;
    String senha = _senhaConroller.text;
    if(_formKey.currentState!.validate()){
      if(queroEntrar){
        print("Entrada Validada");
      } else {
        print("Cadastro Validado");
        print("${_emailConroller.text}, ${_senhaConroller.text}, ${_nomeConroller.text}");
        _autenServico.cadastrarUsuario(email: email, senha: senha, nome: nome);
      }
    }
    else{
      print("Invalido");
    } 
  }
}