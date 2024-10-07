import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/models/search/filter_result.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/search_history.dart';
import 'package:trip_manager/views/search/widgets/search_history_result_item.dart';
import 'widgets/build_filter_results_view.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController searchInputController;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    searchInputController = TextEditingController();
    tabController = TabController(length: 5, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchHistoryProvider.notifier).updateQuery('');
    });
  }

  @override
  void dispose() {
    searchInputController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchHistory = ref.watch(searchHistoryProvider);
    final searchHistoryNotifier = ref.read(searchHistoryProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          SearchInputBar(
            searchInputController: searchInputController,
            onChanged: (value) {
              searchHistoryNotifier.updateQuery(value);
            },
            onSubmitted: () async {
              final searchTerm = searchHistory.query;

              if (searchTerm.isNotEmpty) {
                await searchHistoryNotifier.addSearchTerm(searchTerm);
              }
            },
          ),
          if (searchHistory.query.isNotEmpty) ...[
            Container(
              child: TabBar(
                controller: tabController,
                onTap: (index) {
                  final tab = ['전체', '지역', '음식', '카페', '공간'][index];
                  searchHistoryNotifier.selectTab(tab);
                },
                tabs: [
                  Tab(text: '전체'),
                  Tab(text: '공간'),
                  Tab(text: '지역'),
                  Tab(text: '음식'),
                  Tab(text: '카페'),
                ],
                // 탭 및 텍스트 색상 설정
                labelColor: AppColors.mainColor,
                unselectedLabelColor: AppColors.lightColor_4,

                // 하단 바 디자인 설정
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.mainColor,
                      width: 3.0, // 하단 바 두께
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab, // 양 끝까지 다 붙게 설정
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  //전체 탭
                  buildFilteredResultsView(
                      searchHistory.filteredResults, true, tabController),
                  //공간 탭
                  buildFilteredResultsView(
                      searchHistory.filteredResults
                          .where((item) => item.spaceType == SpaceType.space)
                          .toList(),
                      false,
                      tabController),
                  //지역 탭
                  buildFilteredResultsView(
                      searchHistory.filteredResults
                          .where((item) => item.spaceType == SpaceType.region)
                          .toList(),
                      false,
                      tabController),
                  //음식 탭
                  buildFilteredResultsView(
                      searchHistory.filteredResults
                          .where(
                              (item) => item.spaceType == SpaceType.restaurant)
                          .toList(),
                      false,
                      tabController),
                  //카페 탭
                  buildFilteredResultsView(
                      searchHistory.filteredResults
                          .where((item) => item.spaceType == SpaceType.cafe)
                          .toList(),
                      false,
                      tabController),
                ],
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.only(
                top: 28.0,
                bottom: 10.0,
                left: 18.0,
                right: 18.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '최근 검색',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(searchHistoryProvider.notifier)
                          .clearAllSearchHistory();
                    },
                    child: Text(
                      '전체 삭제',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkColor_3),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: searchHistory.history.length,
                itemBuilder: (context, index) {
                  final item = searchHistory.history[index];
                  return SearchHistoryResultItem(item: item, ref: ref);
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class SearchInputBar extends ConsumerWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;
  final TextEditingController _searchInputController;

  const SearchInputBar({
    super.key,
    required TextEditingController searchInputController,
    required this.onChanged,
    required this.onSubmitted,
  }) : _searchInputController = searchInputController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 66, left: 18.0, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back)),
          SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: _searchInputController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 20),
                hintText: '공간/지역 검색',
                filled: true,
                fillColor: AppColors.lightColor_1,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0), // BorderRadius 추가
                  borderSide: const BorderSide(
                    color: Colors.transparent, // 경계를 없앰
                    width: 0,
                  ),
                ),
              ),
              onChanged: onChanged,
              onFieldSubmitted: (value) {
                onSubmitted();
              },
            ),
          ),
        ],
      ),
    );
  }
}
