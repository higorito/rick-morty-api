import '../../models/per_model_aux.dart';

abstract class PersonagemAdapter {
  static List<PersonagemModel2> fromJson(dynamic json) {
    return json['results']
        .map<PersonagemModel2>((data) => PersonagemModel2.fromJson(data))
        .toList();
  }
}
