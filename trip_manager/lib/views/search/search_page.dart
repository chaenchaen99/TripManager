import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/models/search/filter_result.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/search_history.dart';

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
            // Tabs for filtering
            Container(
              child: TabBar(
                controller: tabController,
                onTap: (index) {
                  final tab = ['전체', '지역', '음식', '카페', '공간'][index];
                  searchHistoryNotifier.selectTab(tab);
                },
                tabs: [
                  Tab(text: '전체'),
                  Tab(text: '지역'),
                  Tab(text: '음식'),
                  Tab(text: '카페'),
                  Tab(text: '공간'),
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
                  buildFilteredResultsView(searchHistory.filteredResults),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == SpaceType.region)
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == SpaceType.restaurant)
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == SpaceType.cafe)
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == SpaceType.space)
                      .toList()),
                ],
              ),
            ),
          ] else ...[
            // Display search history when query is empty
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
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
                    dense: true,
                    title: Row(
                      children: [
                        Image.asset(
                          'assets/icons/schedule.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 12),
                        Text(
                          item,
                          style: TextStyle(fontSize: 16),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(searchHistoryProvider.notifier)
                                .clearSearchHistory(item);
                          },
                          child: Container(
                            padding: EdgeInsets.all(9),
                            child: Image.asset(
                              'assets/icons/close.png',
                              width: 11,
                              height: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildFilteredResultsView(List<FilterResult> results) {
    // Initialize a map to group results by SpaceType with a limit of 5 items each
    final Map<SpaceType, List<FilterResult>> groupedResults = {
      SpaceType.region: [],
      SpaceType.restaurant: [],
      SpaceType.cafe: [],
      SpaceType.space: [],
    };

    // Populate the map with results, limiting each category to 5 items
    for (var item in results) {
      if (groupedResults[item.spaceType]!.length < 5) {
        groupedResults[item.spaceType]!.add(item);
      }
    }

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (groupedResults[SpaceType.region]!.isNotEmpty) ...[
          buildSection('지역', groupedResults[SpaceType.region]!),
        ],
        if (groupedResults[SpaceType.restaurant]!.isNotEmpty) ...[
          buildSection('음식', groupedResults[SpaceType.restaurant]!),
        ],
        if (groupedResults[SpaceType.cafe]!.isNotEmpty) ...[
          buildSection('카페', groupedResults[SpaceType.cafe]!),
        ],
        if (groupedResults[SpaceType.space]!.isNotEmpty) ...[
          buildSection('공간', groupedResults[SpaceType.space]!),
        ],
      ],
    );
  }

  Widget buildSection(String title, List<FilterResult> results) {
    final displayResults = results.take(5).toList();
    final showMore = results.length > 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 18.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ...displayResults.map((item) => buildResultTile(item)).toList(),
        if (showMore) ...[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
            child: TextButton(
              onPressed: () {
                // TODO: 전체보기 버튼 클릭 시 전체 리스트 보기
              },
              child: Text('전체보기'),
            ),
          ),
        ],
      ],
    );
  }

  Widget buildResultTile(FilterResult item) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
      dense: true,
      title: Row(
        children: [
          Image.asset(
            'assets/icons/schedule.png',
            width: 20,
            height: 20,
          ),
          SizedBox(width: 12),
          Text(
            item.name,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              ref
                  .read(searchHistoryProvider.notifier)
                  .clearSearchHistory(item.name);
            },
            child: Container(
              padding: EdgeInsets.all(9),
              child: Image.asset(
                'assets/icons/close.png',
                width: 11,
                height: 11,
              ),
            ),
          ),
        ],
      ),
      onTap: () {},
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
