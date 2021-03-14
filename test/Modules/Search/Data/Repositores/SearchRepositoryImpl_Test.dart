import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/Modules/Search/Data/DataSouces/Models/ResultSearchModel.dart';
import 'package:search_app/Modules/Search/Data/DataSouces/SearchDataSource.dart';
import 'package:search_app/Modules/Search/Data/Repositories/SearchRepositoryImpl.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';

class SearchDataSouceMock extends Mock implements SearchDataSouce {}

void main() {
  final dataSouceMock = SearchDataSouceMock();
  final repository = SearchRepositoryImpl(dataSouceMock);

  test('should return a list of ResultSearch', () async {
    when(dataSouceMock.getSearch(any))
        .thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search('sandro');
    expect(result | null, isA<List<ResultSearch>>());
  });
  test('must return an DataSouceError if the DataSouce is fail', () async {
    when(dataSouceMock.getSearch(any)).thenThrow(Exception());
    final result = await repository.search('sandro');
    expect(result.fold(id, id), isA<DataSouceError>());
  });
}
