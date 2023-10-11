import 'dart:convert';

import 'package:rick_morty_boaspraticas/app/data/http/http_client.dart';

import '../http/exceptions.dart';
import '../models/per_model_aux.dart';

import 'adapters/personagem_adapter.dart';

abstract class IPersonagemRepository {
  Future<List<PersonagemModel2>> getPersonagens();
  // Future<PersonagemModel2> getPersonagem(int id);
  // Future<PersonagemModel2> createPersonagem(PersonagemModel2 personagem);
  // Future<PersonagemModel2> updatePersonagem(PersonagemModel2 personagem);
  // Future<PersonagemModel2> deletePersonagem(int id);
}

class PersonagemRepository implements IPersonagemRepository {
  final IHttpClient httpClient;

  PersonagemRepository({required this.httpClient});

  @override
  Future<List<PersonagemModel2>> getPersonagens() async {
    final resposta =
        await httpClient.get(url: 'https://rickandmortyapi.com/api/character');

    if (resposta.statusCode == 200) {
      // final List<PersonagemModel2> personagens = [];

      final body = jsonDecode(resposta.body);

      // for (var item in body['results']) {
      //   personagens.add(PersonagemModel2.fromJson(item));
      // }

      return PersonagemAdapter.fromJson(body);
    } else if (resposta.statusCode == 404) {
      throw NotFoundException('URL não é válida');
    } else {
      throw Exception('Erro ao buscar personagens');
    }
  }
}
