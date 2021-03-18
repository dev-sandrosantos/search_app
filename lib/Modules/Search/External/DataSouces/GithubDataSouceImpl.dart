import 'package:dio/dio.dart';
import 'package:search_app/Modules/Search/Data/DataSouces/Models/ResultSearchModel.dart';
import 'package:search_app/Modules/Search/Data/DataSouces/SearchDataSource.dart';
import 'package:search_app/Modules/Search/Domain/Errors/Errors.dart';

extension on String {
  nameReplaceAll() {
    return this.replaceAll(" ", "+");
  }
}

class GithubDataSouce implements SearchDataSouce {
  final Dio dio;

  GithubDataSouce(this.dio);

  @override
  Future<List<ResultSearchModel>> getSearch(String searchText) async {
    final response = await dio.get(
        "https://api.github.com/search/users?q=${searchText.nameReplaceAll()}");
    if (response.statusCode == 200) {
      final list = (response.data["items"] as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      print(list.map((e) => e.id.toString()));
      return list;
    } else {
      throw DataSouceError();
    }
  }
}
