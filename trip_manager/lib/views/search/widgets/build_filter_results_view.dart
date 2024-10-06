import 'package:flutter/material.dart';
import 'package:trip_manager/views/search/widgets/build_result_tile.dart';
import '../../../models/search/filter_result.dart';

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
      if (groupedResults[SpaceType.space]!.isNotEmpty) ...[
        buildSection('공간', groupedResults[SpaceType.space]!),
      ],
      if (groupedResults[SpaceType.restaurant]!.isNotEmpty) ...[
        buildSection('음식', groupedResults[SpaceType.restaurant]!),
      ],
      if (groupedResults[SpaceType.cafe]!.isNotEmpty) ...[
        buildSection('카페', groupedResults[SpaceType.cafe]!),
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
      ...displayResults
          .map((item) => BuildResultTile(
                item: item,
              ))
          .toList(),
      if (showMore) ...[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
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
