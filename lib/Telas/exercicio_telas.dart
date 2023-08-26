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
      backgroundColor: const Color(0xFF0A6D92),
      appBar: AppBar(
        title: Text("${exercicioModelo.nome} / ${exercicioModelo.treino}"),
        centerTitle: true,  
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        // ignore: avoid_print
        print("FOI PRESSIONADO");
        
      }, 
      child: const Icon(Icons.add),
      ),

      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(16),
          ),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Enviar Foto")
                  ),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Tirar foto"))
                ],
              ),
            ),
            const SizedBox(height: 8,),
            const Text(
              "Como Fazer?", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            Text(
              exercicioModelo.comoFazer),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const Text(
              "Aqui vai ter uma configuração", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index){
                SentimentoModelo sentimentoAgora = listaSentimentos[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoAgora.sentindo), 
                  subtitle: Text(sentimentoAgora.data),
                  leading: const Icon(Icons.double_arrow_rounded),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: (){
                      print("DELETE ${sentimentoAgora.sentindo}");
                     },
                    ),
                );  
              }),
            )
          ],
        ),
      )
    );
  }
}