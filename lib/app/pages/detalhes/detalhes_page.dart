import 'package:flutter/material.dart';
import 'package:rick_morty_boaspraticas/app/data/models/per_model_aux.dart';

class DetalhesPage extends StatelessWidget {
  const DetalhesPage({super.key, required this.personagem});

  final PersonagemModel2 personagem;

  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  personagem.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                radius: 100,
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
                        const Text(
                          "Espécie: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          personagem.species,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Origem: ",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(personagem.origin.name,
                            style: const TextStyle(fontSize: 18)),
                      ],
                    )
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
