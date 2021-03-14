import 'package:dartz/dartz.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText);
}
