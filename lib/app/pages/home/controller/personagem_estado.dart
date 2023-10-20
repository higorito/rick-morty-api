import 'package:flutter/material.dart';
import 'package:rick_morty_boaspraticas/app/data/http/exceptions.dart';

import 'package:rick_morty_boaspraticas/app/data/repositories/personagem_repository.dart';

import '../../../data/models/per_model_aux.dart';

class PersonagemEstado {
  //inversao de dependencia, dai pode passar qlq repositorio q implemente a interface

  final IPersonagemRepository repository;

  final ValueNotifier<bool> carregando = ValueNotifier<bool>(false);

  final ValueNotifier<String> erro = ValueNotifier<String>('');

  final ValueNotifier<List<PersonagemModel2>> estado =
      ValueNotifier<List<PersonagemModel2>>([]);

  PersonagemEstado({required this.repository}); //construtor

  getPersonagem() async {
    carregando.value = true;

    try {
      final resultado = await repository.getPersonagens();
      estado.value =
          resultado; //percebe q o estado.value é uma lista de personagens
    } on NotFoundException catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }

    carregando.value = false;
  }
}
