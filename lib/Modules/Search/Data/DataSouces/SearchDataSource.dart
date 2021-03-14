import 'package:search_app/Modules/Search/Data/DataSouces/Models/ResultSearchModel.dart';

abstract class SearchDataSouce {
  Future<List<ResultSearchModel>> getSearch(String searchText);
}
