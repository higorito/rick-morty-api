import 'package:flutter/material.dart';
import 'package:rick_morty_boaspraticas/app/data/http/http_client.dart';
import 'package:rick_morty_boaspraticas/app/pages/detalhes/detalhes_page.dart';
import 'package:rick_morty_boaspraticas/app/pages/home/controller/personagem_estado.dart';

import '../../data/repositories/personagem_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //a parte mais importante
  final PersonagemEstado estado = PersonagemEstado(
    repository: PersonagemRepository(
      httpClient: HttpClient(),
    ),
  );

  // final List<PersonagemModel2> personagens = [];

  @override
  void initState() {
    super.initState();
    estado.getPersonagem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage', style: TextStyle(letterSpacing: 4)),
        centerTitle: true,
        elevation: 2,
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          estado.carregando,
          estado.erro,
          estado.estado,
        ]),
        builder: (BuildContext context, Widget? child) {
          if (estado.carregando.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (estado.erro.value.isNotEmpty) {
            return Center(
              child: Text(estado.erro.value),
            );
          } else {
            return ListView.builder(
              itemCount: estado.estado.value.length,
              itemBuilder: (BuildContext context, int index) {
                final personagem = estado.estado.value[index];
                return Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        // blurRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Image.network(
                      personagem.image,
                    ),
                    title: Text(
                      personagem.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    subtitle: (personagem.status == 'Alive')
                        ? Text(
                            personagem.status,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            personagem.status,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                    trailing: Icon(
                      //AQ VOU CRIAR A LOGICA DE FAVORITAR DEPOIS
                      (personagem.species == "Human")
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.redAccent,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetalhesPage(
                            personagem: estado.estado.value[index],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
