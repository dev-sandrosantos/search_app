import 'dart:convert';

import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';

class ResultSearchModel extends ResultSearch {
  final String title;
  final String subTitle;
  final String img;

  ResultSearchModel({this.title, this.subTitle, this.img});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subTitle,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      title: map['title'],
      subTitle: map['subTitle'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
