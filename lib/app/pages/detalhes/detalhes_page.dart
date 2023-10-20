import 'package:flutter/material.dart';
import 'package:rick_morty_boaspraticas/app/data/models/per_model_aux.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key, required this.personagem});

  final PersonagemModel2 personagem;

  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetalhesPage'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                child: Image.network(
                  personagem.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                personagem.name,
                style: const TextStyle(fontSize: 28),
              ),
              Text(
                personagem.status,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            "Espécie: ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            personagem.species,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            "Gênero: ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            personagem.gender,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            "Origem: ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            personagem.origin.name,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            "Localização: ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            personagem.location.name,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text(
                            "Episódios: ",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            height: altura * 0.2,
                            width: largura * 0.5,
                            child: ListView.builder(
                              itemCount: personagem.episode.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    personagem.episode[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
