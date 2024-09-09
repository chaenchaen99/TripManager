import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'search_history.g.dart';
part 'search_history.freezed.dart';

@freezed
class SearchHistoryState with _$SearchHistoryState {
  const factory SearchHistoryState({
    required List<String> history,
    required List<String> filteredResults,
    required String query,
  }) = _SearchHistoryState;
}

@riverpod
class SearchHistory extends _$SearchHistory {
  @override
  SearchHistoryState build() {
    _loadSearchHistory();
    return SearchHistoryState(history: [], filteredResults: [], query: '');
  }

  // 검색어 업데이트
  Future<void> updateQuery(String query) async {
    state = state.copyWith(query: query);
    await filterSearchHistory(query);
  }

  // SharedPreferences에서 검색 기록 불러오기
  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final storedHistory = prefs.getStringList('search_history') ?? [];
    state = state.copyWith(history: storedHistory);
  }

  // 검색 기록 추가 및 저장
  Future<void> addSearchTerm(String term) async {
    if (!state.history.contains(term)) {
      state = state.copyWith(history: [...state.history, term]);
      await _saveSearchHistory(); // 검색 기록을 로컬에 저장
    }
  }

  // 검색 기록을 SharedPreferences에 저장
  Future<void> _saveSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', state.history);
  }

  // 검색 기록 전체 삭제
  Future<void> clearAllSearchHistory() async {
    state = state.copyWith(history: []);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
  }

  // 특정 검색 기록 삭제
  Future<void> clearSearchHistory(String item) async {
    final updatedHistory = [...state.history]..remove(item);
    state = state.copyWith(history: updatedHistory);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('search_history', updatedHistory);
  }

  // 검색어 필터링
  Future<List<String>> filterSearchHistory(String query) async {
    if (query.isEmpty) {
      return state.history;
    }

    // Call the asynchronous method to filter search history
    await _filterSearchHistory(query);
    return state.filteredResults;
  }

  //검색어 필터링
  Future<void> _filterSearchHistory(String query) async {
    List<String> serverResults = await _fetchFilteredResultsFromServer(query);
    state = state.copyWith(filteredResults: serverResults);
  }

  Future<List<String>> _fetchFilteredResultsFromServer(String query) async {
    // TODO: 서버 요청 로직 작성

    List<String> data = [
      '강남구',
      '가마솥통닭',
      '가산 카페',
      '가산 호텔',
      '가산 백화점',
      '가산 경찰서',
      '가산 소방서',
    ];

    // 문자열을 정규화하는 함수
    String normalize(String text) {
      return text
          .toLowerCase()
          .replaceAll(RegExp(r'\s+'), ''); // 소문자 변환 및 공백 제거
    }

    String normalizedQuery = normalize(query);

    // 검색어가 항목의 부분 문자열로 포함되어 있는지 확인
    bool containsSubstring(String text, String query) {
      String normalizedText = normalize(text);
      return normalizedText.contains(query);
    }

    return data
        .where((term) => containsSubstring(term, normalizedQuery))
        .toList();
  }
}
