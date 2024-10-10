import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_manager/%08common/constants.dart';
import 'package:trip_manager/models/search/filter_result.dart';
import 'package:trip_manager/theme.dart';
import 'package:trip_manager/views/search/providers/search_notifier.dart';
import 'package:trip_manager/views/search/search_result_tab_page.dart';
import 'package:trip_manager/views/search/widgets/search_history_result_item.dart';

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
      ref.read(searchNotifierProvider.notifier).updateQuery('');
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
    final searchResult = ref.watch(searchNotifierProvider);
    final searchResultNotifier = ref.read(searchNotifierProvider.notifier);

    final tabs = [
      AppConstants.CATEGORY_ALL,
      AppConstants.CATEGORY_SPACE,
      AppConstants.CATEGORY_REGION,
      AppConstants.CATEGORY_RESTAURANT,
      AppConstants.CATEGORY_CAFE,
    ];

    return Scaffold(
      body: Column(
        children: [
          SearchInputBar(
            searchInputController: searchInputController,
            onChanged: (value) => searchResultNotifier.updateQuery(value),
            onSubmitted: () async {
              final searchTerm = searchResult.query;
              if (searchTerm.isNotEmpty) {
                await searchResultNotifier.addSearchTerm(searchTerm);
              }
            },
          ),
          if (searchResult.query.isNotEmpty) ...[
            SearchTabBar(
              tabController: tabController,
              onTap: (index) => searchResultNotifier.selectTab(tabs[index]),
              tabs: tabs,
            ),
            Expanded(
              child: SearchTabBarView(
                tabController: tabController,
                searchResult: searchResult,
              ),
            ),
          ] else ...[
            Expanded(
              child: SearchHistoryList(
                ref: ref,
                searchResult: searchResult,
                searchInputController: searchInputController,
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

class SearchTabBar extends StatelessWidget {
  final TabController tabController;
  final ValueChanged<int> onTap;
  final List<String> tabs;

  const SearchTabBar({
    super.key,
    required this.tabController,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        onTap: onTap,
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
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
    );
  }
}

class SearchTabBarView extends ConsumerWidget {
  const SearchTabBarView({
    super.key,
    required this.tabController,
    required this.searchResult,
  });

  final TabController tabController;
  final SearchResult searchResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TabBarView(
      controller: tabController,
      children: [
        //전체 탭
        SearchResultTabPage(
          filteredResults: searchResult.filteredResults,
          isAllTab: true,
          tabController: tabController,
        ),
        //공간 탭
        SearchResultTabPage(
          filteredResults: ref
              .read(searchNotifierProvider.notifier)
              .getResultWithCategory(SpaceType.space),
          isAllTab: false,
          tabController: tabController,
        ),
        //지역 탭
        SearchResultTabPage(
          filteredResults: ref
              .read(searchNotifierProvider.notifier)
              .getResultWithCategory(SpaceType.region),
          isAllTab: false,
          tabController: tabController,
        ),
        //음식 탭
        SearchResultTabPage(
          filteredResults: ref
              .read(searchNotifierProvider.notifier)
              .getResultWithCategory(SpaceType.restaurant),
          isAllTab: false,
          tabController: tabController,
        ),
        //카페 탭
        SearchResultTabPage(
          filteredResults: ref
              .read(searchNotifierProvider.notifier)
              .getResultWithCategory(SpaceType.cafe),
          isAllTab: false,
          tabController: tabController,
        ),
      ],
    );
  }
}

class SearchHistoryList extends StatelessWidget {
  final WidgetRef ref;
  final SearchResult searchResult;
  final TextEditingController searchInputController;

  const SearchHistoryList({
    super.key,
    required this.ref,
    required this.searchResult,
    required this.searchInputController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  ref.read(searchNotifierProvider.notifier).clearAllSearch();
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
            itemCount: searchResult.history.length,
            itemBuilder: (context, index) {
              final item = searchResult.history[index];
              return SearchHistoryResultItem(
                  item: item,
                  ref: ref,
                  searchInputController: searchInputController);
            },
          ),
        ),
      ],
    );
  }
}
