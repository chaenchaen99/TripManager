import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_history.g.dart';

@riverpod
class SearchHistory extends _$SearchHistory {
  @override
  List<String> build() {
    return [];
  }

  //검색 기록 추가
  void addSearchTerm(String term) {
    if (!state.contains(term)) {
      state = [...state, term];
    }
  }

  //검색어 필터링
  List<String> filterSearchHistory(String query) {
    if (query.isEmpty) {
      return state;
    }

    return state
        .where((term) => term.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
