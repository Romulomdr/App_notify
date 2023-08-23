

import "package:flutter/material.dart";

class ExercicioTela extends StatelessWidget {
  const ExercicioTela({super.key});

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
              "Texto top aleatorio"),
            const Divider(),
            const Text(
              "Aqui vai ter uma configuração", 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18,
              ),
            ),
            Text("e aqui vai ser o espaço para preencher")
          ],
        ),
      )
    );
  }
}