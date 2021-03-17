import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:search_app/Modules/Search/Data/Repositories/SearchRepositoryImpl.dart';
import 'package:search_app/Modules/Search/Domain/Entities/UseCases/SearchByText.dart';
import 'package:search_app/Modules/Search/External/DataSouces/GithubDataSouceImpl.dart';
import 'package:search_app/Modules/Search/Presenter/Search/SearchPage.dart';
import 'package:search_app/Modules/Search/Presenter/SearchBloC.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => SearchByTextImpl(i())),
    Bind((i) => SearchRepositoryImpl(i())),
    Bind((i) => GithubDataSouce(i())),
    Bind.singleton((i) => SearchBloC(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, argument) => SearchPage()),
  ];
}
