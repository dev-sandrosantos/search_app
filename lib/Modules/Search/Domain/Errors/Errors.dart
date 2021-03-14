abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DataSouceError implements FailureSearch {
  final String e;

  DataSouceError({this.e});
}
