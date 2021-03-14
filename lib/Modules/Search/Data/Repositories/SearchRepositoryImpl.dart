import 'package:search_app/Modules/Search/Data/DataSouces/SearchDataSource.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';
import 'package:search_app/Modules/Search/Domain/Entities/ResultSearch.dart';
import 'package:dartz/dartz.dart';
import 'package:search_app/Modules/Search/Domain/Repositories/SearchRepository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSouce searchDataSouce;

  SearchRepositoryImpl(this.searchDataSouce);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(
      String searchText) async {
    try {
      final result = await searchDataSouce.getSearch(searchText);
      return Right(result);
    } on DataSouceError catch (e) {
      print(e);
      return left(e);
    } catch (e) {
      return left(DataSouceError());
    }
  }
}
