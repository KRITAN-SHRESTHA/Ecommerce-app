import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/extension.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/category_chip.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/filter_bottom_sheet.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/filter_button.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/product_card.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class _Product {
  const _Product({
    required this.name,
    required this.price,
    this.imagePath,
    this.discountPercent,
  });

  final String name;
  final String price;
  final String? imagePath;
  final int? discountPercent;
}

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  final _categories = const [
    'All',
    'Tshirts',
    'Jeans',
    'Shoes',
    'Jackets',
    'shresthakritan',
  ];
  int _selectedCategoryIndex = 0;

  final _products = const [
    _Product(
      name: 'Regular Fit Slogan',
      price: '1,190',
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit Polo',
      price: '1,100',
      discountPercent: 52,
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit Black',
      price: '1,690',
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit V-Neck',
      price: '1,290',
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit V-Neck',
      price: '1,290',
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit V-Neck',
      price: '1,290',
      imagePath: kSampleProductImage,
    ),
    _Product(
      name: 'Regular Fit V-Neck',
      price: '1,290',
      imagePath: kSampleProductImage,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(kDiscover, style: textHeader2),
                GestureDetector(
                  onTap: () => context.router.push(NotificaitonRoute()),
                  child: SvgPicture.asset(kNotificaitonIcon).pOnly(bottom: 16),
                ),
              ],
            ),
            SizedBox(
              height: 52,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentGeometry.center,
                      child: SearchTextField(
                        controller: _searchController,
                        hint: kSearchForClothesHint,
                        readOnly: true,
                        onTap: () => context.router.push(const SearchRoute()),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilterButton(
                    onTap: () => showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: kWhiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      builder: (context) => const FilterBottomSheet(),
                    ),
                  ),
                ],
              ),
            ).py(20),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) => CategoryChip(
                  label: _categories[index],
                  selected: index == _selectedCategoryIndex,
                  onTap: () => setState(() => _selectedCategoryIndex = index),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.62,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ProductCard(
                    onFavoriteTap: () {},

                    isFavorite: false,
                    name: product.name,
                    price: product.price,
                    imagePath: product.imagePath,
                    discountPercent: product.discountPercent,
                  );
                },
              ).pOnly(top: 5),
            ),
          ],
        ).px(24),
      ),
    );
  }
}
