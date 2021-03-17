import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/AppModule.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Entities/UseCases/SearchByText.dart';

import 'Modules/Search/Utils/GithubResponse.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dioMock = DioMock();
  initModule(AppModule(), replaceBinds: [Bind<Dio>((i) => dioMock)]);
  test('should recover useCase without errors', () {
    final useCase = Modular.get<SearchByText>();
    expect(useCase, isA<SearchByTextImpl>());
  });

  test('must return a list of ResutSeach', () async {
    when(dioMock.get((any))).thenAnswer((_) async => Response(
        data: jsonDecode(githubResponse), statusCode: 200, request: null));
    final useCase = Modular.get<SearchByText>();
    final result = await useCase("Alexsandro");
    expect(result | null, isA<List<ResultSearch>>());
  });
}
