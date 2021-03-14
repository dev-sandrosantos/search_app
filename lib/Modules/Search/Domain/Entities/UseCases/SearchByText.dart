import 'package:dartz/dartz.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';
import 'package:search_app/Modules/Search/Domain/Repositories/SearchRepository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(
      String searchText) async {
    if (searchText == null || searchText.isEmpty) {
      return Left(InvalidTextError());
    }
    return repository.search(searchText);
  }
}
