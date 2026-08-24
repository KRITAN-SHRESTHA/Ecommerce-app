import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/recent_searches.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();

  final _recentSearches = ['Jeans', 'Casual clothes', 'Hoodie'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _removeRecentSearch(int index) {
    setState(() => _recentSearches.removeAt(index));
  }

  void _clearAllRecentSearches() {
    setState(() => _recentSearches.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.router.maybePop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(kSearchLabel, style: textHeader4),
                    ),
                  ),
                  SvgPicture.asset(kNotificaitonIcon, width: 24, height: 24),
                ],
              ),
              SizedBox(
                height: 56,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SearchTextField(
                        controller: _searchController,
                        hint: kSearchForClothesHint,
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ).py(20),
              RecentSearches(
                searches: _recentSearches,
                onClearAll: _clearAllRecentSearches,
                onRemove: _removeRecentSearch,
              ).pOnly(top: 10),
            ],
          ),
        ),
      ),
    );
  }
}
