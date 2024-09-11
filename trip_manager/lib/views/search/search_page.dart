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
              color: Colors.grey[200],
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
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  buildFilteredResultsView(searchHistory.filteredResults),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == '지역')
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == '음식')
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == '카페')
                      .toList()),
                  buildFilteredResultsView(searchHistory.filteredResults
                      .where((item) => item.spaceType == '공간')
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
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
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
      },
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
