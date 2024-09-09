import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_manager/theme.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchInputController =
        TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 66,
          left: 18,
          right: 18,
        ),
        child: Column(
          children: [
            SearchInputBar(searchInputController: _searchInputController),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        //헤어 부분
                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            '최근 검색',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      } else {
                        //검색 기록 리스트 부분
                        return ListTile(
                          leading: Image.asset(
                            'assets/icons/schedule.png',
                            width: 20,
                            height: 20,
                          ),
                          title: Text('검색기록'),
                          onTap: () {},
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInputBar extends StatelessWidget {
  const SearchInputBar({
    super.key,
    required TextEditingController searchInputController,
  }) : _searchInputController = searchInputController;

  final TextEditingController _searchInputController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back),
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
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
