import "package:flutter/material.dart";
import "package:notif_project/Modelos/exercicio_modelo.dart";
import "package:notif_project/Modelos/exercicio_resultado.dart";

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExercicioModelo exercicioModelo = ExercicioModelo(
    id: "EX001", 
    nome: "Remada Baixa", 
    treino: "Treino A", 
    comoFazer: "Segura a barra e puxa");

  final List<SentimentoModelo> listaSentimentos = [
    SentimentoModelo(
      id: "SE001", 
      sentindo: "Dor no ombro", 
      data: "2023-08-24"),
    SentimentoModelo(
      id: "SE002", 
      sentindo: "Dor na perna esquerda", 
      data: "2023-08-23"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Barra Estilosa")),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // ignore: avoid_print
        print("FOI PRESSIONADO");
        
      }, 
      child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: const Text("Enviar Foto")
            ),
            const Text(
              "Como Fazer?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            const Text(
              "01010101010110101"),
            const Divider(),
            const Text(
              "Aqui vai ter uma configuração", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            const Text("e aqui vai ser o espaço para preencher")
          ],
        ),
      )
    );
  }
}