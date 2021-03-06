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
    Bind.lazySingleton((i) => SearchByTextImpl(i.get())),
    Bind.lazySingleton((i) => SearchRepositoryImpl(i.get())),
    Bind.lazySingleton((i) => GithubDataSouce(i.get())),
    Bind.lazySingleton((i) => SearchBloC(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, argument) => SearchPage()),
  ];
}
