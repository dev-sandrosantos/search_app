import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Entities/UseCases/SearchByText.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';
import 'package:search_app/Modules/Search/Domain/Repositories/SearchRepository.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final useCase = SearchByTextImpl(repository);

  test('should return a list of ResultSearch', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final resul = await useCase.call("Sandro");
    expect(resul | null, isA<List<ResultSearch>>());
  });

  test('must return an InvalidTextError if the text is invalid', () async {
    when(repository.search(any))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    var resul = await useCase.call(null);
    expect(resul.fold(id, id), isA<InvalidTextError>());
    resul = await useCase.call("");
    expect(resul.fold(id, id), isA<InvalidTextError>());
  });
}
