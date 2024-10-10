import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_manager/models/search/filter_result.dart';

part 'search_notifier.freezed.dart';
part 'search_notifier.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<String> history,
    required List<FilterResult> filteredResults,
    required String query,
    required String selectedTab,
  }) = _SearchResult;
}

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchResult build() {
    _loadSearch();
    return SearchResult(
      history: [],
      filteredResults: [],
      query: '',
      selectedTab: '전체',
    );
  }

  //탭 선택 상태 관리
  void selectTab(String tab) {
    state = state.copyWith(selectedTab: tab);
  }

  // 검색어 업데이트
  Future<void> updateQuery(String query) async {
    state = state.copyWith(query: query);
    await getFilteredResults(state.query);
  }

  // SharedPreferences에서 검색 기록 불러오기
  Future<void> _loadSearch() async {
    final prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('search_history') ?? [];
    state = state.copyWith(history: storedHistory);
  }

  // 검색 기록 추가 및 저장
  Future<void> addSearchTerm(String term) async {
    if (!state.history.contains(term)) {
      state = state.copyWith(history: [...state.history, term]);
      await _saveSearch(); // 검색 기록을 로컬에 저장
    }
  }

  // 검색 기록을 SharedPreferences에 저장
  Future<void> _saveSearch() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', state.history);
  }

  // 검색 기록 전체 삭제
  Future<void> clearAllSearch() async {
    state = state.copyWith(history: []);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
  }

  // 특정 검색 기록 삭제
  Future<void> clearSearch(Object item) async {
    final updatedHistory = [...state.history]..remove(item);
    state = state.copyWith(history: updatedHistory);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', updatedHistory);
  }

  // 검색어 필터링
  Future<void> getFilteredResults(String query) async {
    // Call the asynchronous method to filter search history
    final _result = await _getFilteredResultsFromServer(query);
    state = state.copyWith(filteredResults: _result);
  }

  // 문자열을 정규화하는 함수
  String normalize(String text) {
    return text.toLowerCase().replaceAll(RegExp(r'\s+'), ''); // 소문자 변환 및 공백 제거
  }

// 검색어가 항목의 이름에 포함되어 있는지 확인
  bool containsKeyword(String name, String query) {
    String normalizedName = normalize(name);
    return normalizedName.contains(query); // 부분 문자열을 찾음
  }

  //특정 카테고리의 아이템 리스트 반환
  List<FilterResult> getResultWithCategory(SpaceType type) {
    return state.filteredResults
        .where((item) => item.spaceType == type)
        .toList();
  }

  //모든 카테고리별 필터링된 아이템 리스트 반환
  Map<SpaceType, List<FilterResult>> getAlldResultsByCategory(
    List<FilterResult> results,
  ) {
    final Map<SpaceType, List<FilterResult>> groupedResults = {
      SpaceType.region: [],
      SpaceType.restaurant: [],
      SpaceType.cafe: [],
      SpaceType.space: [],
    };

    for (var item in results) {
      groupedResults[item.spaceType]!.add(item);
    }

    return groupedResults;
  }

  //전체 탭에서 각 카테고리별 5개의 아이템만 보이도록 설정
  List<FilterResult> getDisplayResultsInAllTab(
    List<FilterResult> results,
    bool isAllTab,
  ) {
    return isAllTab && results.length > 5 ? results.sublist(0, 5) : results;
  }

  // 검색어 필터링 메서드
  //TODO: 데이터 대입 부분 분리 필요
  Future<List<FilterResult>> _getFilteredResultsFromServer(String query) async {
    List<FilterResult> data = [
      FilterResult(spaceType: SpaceType.region, name: "강남구", subInfo: "서울"),
      FilterResult(
          spaceType: SpaceType.space, name: "한강", subInfo: "서울 영등포구 · 관광명소"),
      FilterResult(
          spaceType: SpaceType.space,
          name: "뚝섬 한강 공원 수영장",
          subInfo: "서울 서초구 · 테마/체험"),
      FilterResult(
          spaceType: SpaceType.space,
          name: "무신사 스탠다드 강남",
          subInfo: "서울 강남구 · 쇼핑"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵1", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵2", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵3", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵4", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵5", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵6", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.cafe, name: "강남 붕어빵7", subInfo: "서울 서초구 · 카페"),
      FilterResult(
          spaceType: SpaceType.restaurant,
          name: "치&강 압구정로데오역점1",
          subInfo: "서울 강남구 · 음식점"),
      FilterResult(
          spaceType: SpaceType.restaurant,
          name: "치&산 압구정로데오역점2",
          subInfo: "서울 강남구 · 음식점"),
    ];

    // 쿼리 정규화
    String normalizedQuery = normalize(query);

    // 부분 문자열을 기준으로 필터링
    var filterResult = data
        .where((filterResult) =>
            containsKeyword(filterResult.name, normalizedQuery))
        .toList();

    state = state.copyWith(filteredResults: filterResult);
    return filterResult;
  }
}
