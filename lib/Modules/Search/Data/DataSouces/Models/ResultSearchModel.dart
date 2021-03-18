import 'dart:convert';

import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';

class ResultSearchModel extends ResultSearch {
  final String login;
  final int id;
  // ignore: non_constant_identifier_names
  final String avatar_url;

  // ignore: non_constant_identifier_names
  ResultSearchModel({this.login, this.id, this.avatar_url});

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'id': id,
      'avatar_url': avatar_url,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      login: map['login'],
      id: map['id'],
      avatar_url: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
