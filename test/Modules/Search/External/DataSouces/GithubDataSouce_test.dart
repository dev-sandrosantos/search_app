import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';
import 'package:search_app/Modules/Search/External/DataSouces/GithubDataSouceImpl.dart';

import '../../Utils/githubResponse.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasouce = GithubDataSouce(dio);
  test('should return a list of ResultSearchModel', () {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(githubResponse), statusCode: 200));
    final result = datasouce.getSearch('Sandro');
    expect(result, completes);
  });

  test('should return an error if the status code is different from 200', () {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));
    final result = datasouce.getSearch('Sandro');
    expect(result, throwsA(isA<DataSouceError>()));
  });
}
