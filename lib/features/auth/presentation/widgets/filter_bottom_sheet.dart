import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/build_button.dart';
import 'package:ecommerceapp/features/auth/presentation/widgets/category_chip.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  static const _sortOptions = [
    kRelevanceText,
    kPriceLowToHighText,
    kPriceHighToLowText,
  ];
  static const _sizes = ['S', 'M', 'L'];

  int _selectedSortIndex = 0;
  RangeValues _priceRange = const RangeValues(0, 19);
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        24 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: kGrey300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(kFiltersTitle, style: textHeader3),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: kGrey200),
          const SizedBox(height: 20),
          Text(kSortByLabel, style: textBody1SemiBold),
          const SizedBox(height: 12),
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _sortOptions.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => CategoryChip(
                label: _sortOptions[index],
                selected: index == _selectedSortIndex,
                onTap: () => setState(() => _selectedSortIndex = index),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: kGrey200),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(kPriceLabel, style: textBody1SemiBold),
              Text(
                '\$ ${_priceRange.start.round()} - \$ ${_priceRange.end.round()}',
                style: textBody1.copyWith(color: kGrey500),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kPrimaryColor,
              inactiveTrackColor: kGrey200,
              thumbColor: kWhiteColor,
              overlayColor: kPrimaryColor.withValues(alpha: 0.1),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                enabledThumbRadius: 10,
                elevation: 2,
              ),
            ),
            child: RangeSlider(
              values: _priceRange,
              min: 0,
              max: 100,
              onChanged: (values) => setState(() => _priceRange = values),
            ),
          ),
          const Divider(color: kGrey200),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(kSizeLabel, style: textBody1SemiBold),
              PopupMenuButton<String>(
                initialValue: _selectedSize,
                onSelected: (size) => setState(() => _selectedSize = size),
                offset: const Offset(0, 28),
                color: kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                itemBuilder: (context) => _sizes
                    .map(
                      (size) => PopupMenuItem(
                        value: size,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              size,
                              style: size == _selectedSize
                                  ? textBody2SemiBold
                                  : textBody2,
                            ),
                            if (size == _selectedSize) ...[
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.check,
                                size: 18,
                                color: kPrimaryColor,
                              ),
                            ],
                          ],
                        ),
                      ),
                    )
                    .toList(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedSize,
                      style: textBody1.copyWith(color: kGrey600),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: kGrey600,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          buildButton(
            onPressed: () {
              return Navigator.of(context).pop();
            },
            text: kApplyFiltersText,
          ),
        ],
      ),
    );
  }
}
