import 'package:bloc/bloc.dart';
import 'package:search_app/Modules/Search/Domain/Entities/UseCases/SearchByText.dart';
import 'package:search_app/Modules/Search/Presenter/Search/States/State.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloC extends Bloc<String, SearchState> {
  final SearchByText userCase;
  SearchBloC(this.userCase) : super(SearchStart());

  @override
  Stream<SearchState> mapEventToState(String searchText) async* {
    yield SearchLoading();
    final result = await userCase(searchText);
    yield result.fold((l) => SearchError(l), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }
}
