import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Entities/UseCases/SearchByText.dart';
import 'package:mockito/mockito.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';
import 'package:search_app/Modules/Search/Presenter/Search/States/State.dart';
import 'package:search_app/Modules/Search/Presenter/SearchBloC.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final userCase = SearchByTextMock();
  final bloC = SearchBloC(userCase);

  test('must return the states in the correct order', () {
    when(userCase.call(any)).thenAnswer((_) async => Right(<ResultSearch>[]));
    expect(
        bloC,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchSuccess>(),
        ]));
    bloC.add('Alexsandro');
  });
  test('must return the error', () {
    when(userCase.call(any)).thenAnswer((_) async => left(InvalidTextError()));
    expect(
        bloC,
        emitsInOrder([
          isA<SearchLoading>(),
          isA<SearchError>(),
        ]));
    bloC.add('Alexsandro');
  });
}
