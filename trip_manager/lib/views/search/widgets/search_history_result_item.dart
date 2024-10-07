import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/views/search/providers/search_notifier.dart';

class SearchHistoryResultItem extends ConsumerWidget {
  const SearchHistoryResultItem({
    super.key,
    required this.item,
    required this.ref,
  });

  final String item;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
      dense: true,
      title: GestureDetector(
        onTap: () {},
        child: Row(
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
                ref.read(searchNotifierProvider.notifier).clearSearch(item);
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
      ),
      onTap: () {},
    );
  }
}
