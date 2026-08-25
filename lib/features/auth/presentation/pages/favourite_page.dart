import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _Product {
  const _Product({required this.name, required this.price, this.imagePath});

  final String name;
  final String price;
  final String? imagePath;
}

@RoutePage()
class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final _savedProducts = [
    const _Product(
      name: 'Regular Fit Slogan',
      price: '1,190',
      imagePath: kSampleProductImage,
    ),
    const _Product(name: 'Regular Fit Polo kritan shrestha', price: '1,190'),
    const _Product(name: 'Regular Fit Black', price: '1,190'),
    const _Product(name: 'Regular Fit V-Neck', price: '1,190'),
    const _Product(name: 'Regular Fit Slogan', price: '1,190'),
    const _Product(name: 'Regular Fit Slogan', price: '1,190'),
  ];

  void _removeSaved(int index) {
    setState(() => _savedProducts.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(kSavedItemsTitle, style: textHeader4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.push(NotificaitonRoute()),
                    child: SvgPicture.asset(
                      kNotificaitonIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
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
                  itemCount: _savedProducts.length,
                  itemBuilder: (context, index) {
                    final product = _savedProducts[index];
                    return ProductCard(
                      name: product.name,
                      price: product.price,
                      imagePath: product.imagePath,
                      isFavorite: true,
                      onFavoriteTap: () => _removeSaved(index),
                    );
                  },
                ),
              ),
              //! uncomment this code to show no items found during api implemtation
              // Expanded(
              //   child: NoResultFounde(
              //     image: kHeartIcon,
              //     noReslutFounText: 'No Saved Items!',
              //     noResultFoundDescription:
              //         "You don't have any saved items.\nGot to home and add some.",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
