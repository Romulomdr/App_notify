//Atributos
class ExercicioModelo{
  String id;
  String nome;
  String treino;
  String comoFazer;

  String? urlImagem;

// Construtor padrão
  ExercicioModelo({
    required this.id,
    required this.nome,
    required this.treino,
    required this.comoFazer,
    });
//Vai usar quando pegar a informação do banco de dados
  ExercicioModelo.fromMap(Map<String, dynamic> map)
    : id = map["id"], 
    nome = map["nome"], 
    treino = map["treino"], 
    comoFazer = map["comoFazer"];

//Para enviar as informações para o banco de dados
  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "nome": "nome", 
      "treino": "treino", 
      "comoFazer": "comoFazer",
      "urlImagem": urlImagem,
    };
  }
}