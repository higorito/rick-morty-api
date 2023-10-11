import 'package:flutter/material.dart';
import 'package:rick_morty_boaspraticas/app/data/http/http_client.dart';
import 'package:rick_morty_boaspraticas/app/pages/home/estado/personagem_estado.dart';

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
        title: const Text('HomePage'),
        centerTitle: true,
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
                return ListTile(
                  leading: Image.network(personagem.image),
                  title: Text(personagem.name),
                  subtitle: Text(personagem.status),
                );
              },
            );
          }
        },
      ),
    );
  }
}
