import 'package:auto_route/auto_route.dart';
import 'package:ecommerceapp/config/routes/routes.dart';
import 'package:ecommerceapp/core/utils/assets.dart';
import 'package:ecommerceapp/core/utils/color.dart';
import 'package:ecommerceapp/core/utils/string.dart';
import 'package:ecommerceapp/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ReviewSortOption { mostRelevant, newest, highestRating, lowestRating }

extension on ReviewSortOption {
  String get label => switch (this) {
    ReviewSortOption.mostRelevant => kMostRelevantText,
    ReviewSortOption.newest => kNewestText,
    ReviewSortOption.highestRating => kHighestRatingText,
    ReviewSortOption.lowestRating => kLowestRatingText,
  };
}

class _Review {
  const _Review({
    required this.rating,
    required this.comment,
    required this.name,
    required this.daysAgo,
  });

  final double rating;
  final String comment;
  final String name;
  final int daysAgo;

  String get timeAgoText {
    if (daysAgo < 7) {
      return daysAgo == 1 ? '1 day ago' : '$daysAgo days ago';
    }
    if (daysAgo < 30) {
      final weeks = (daysAgo / 7).round();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    }
    final months = (daysAgo / 30).round();
    return months <= 1 ? '1 month ago' : '$months months ago';
  }
}

@RoutePage()
class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  static const _totalRatings = 1034;
  static const _averageRating = 4.0;

  // (star level, fraction of the bar to fill) — matches the Figma export's
  // bar lengths directly rather than being derived from counts, since these
  // are placeholder figures, not a real computed distribution.
  static const _ratingBreakdown = [
    (stars: 5, fraction: 0.80),
    (stars: 4, fraction: 0.46),
    (stars: 3, fraction: 0.20),
    (stars: 2, fraction: 0.08),
    (stars: 1, fraction: 0.03),
  ];

  static const _reviews = [
    _Review(
      rating: 5,
      comment:
          'The item is very good, my son likes it very much and plays '
          'every day.',
      name: 'Wade Warren',
      daysAgo: 6,
    ),
    _Review(
      rating: 4,
      comment:
          'The seller is very fast in sending packet, I just bought it '
          'and the item arrived in just 1 day!',
      name: 'Guy Hawkins',
      daysAgo: 7,
    ),
    _Review(
      rating: 4,
      comment:
          'I just bought it and the stuff is really good! I highly '
          'recommend it!',
      name: 'Robert Fox',
      daysAgo: 14,
    ),
    _Review(
      rating: 3,
      comment:
          'I just bought it and the stuff is really good! I highly '
          'recommend it!',
      name: 'Robert Fox',
      daysAgo: 16,
    ),
    _Review(
      rating: 5,
      comment:
          'I just bought it and the stuff is really good! I highly '
          'recommend it!',
      name: 'Robert Fox',
      daysAgo: 18,
    ),
    _Review(
      rating: 2,
      comment:
          'I just bought it and the stuff is really good! I highly '
          'recommend it!',
      name: 'Robert Fox',
      daysAgo: 20,
    ),
    _Review(
      rating: 4,
      comment:
          'I just bought it and the stuff is really good! I highly '
          'recommend it!',
      name: 'Robert Fox',
      daysAgo: 22,
    ),
  ];

  ReviewSortOption _selectedSort = ReviewSortOption.mostRelevant;

  List<_Review> get _sortedReviews {
    final reviews = List<_Review>.of(_reviews);
    switch (_selectedSort) {
      case ReviewSortOption.mostRelevant:
        break; // keep the original curated order
      case ReviewSortOption.newest:
        reviews.sort((a, b) => a.daysAgo.compareTo(b.daysAgo));
      case ReviewSortOption.highestRating:
        reviews.sort((a, b) => b.rating.compareTo(a.rating));
      case ReviewSortOption.lowestRating:
        reviews.sort((a, b) => a.rating.compareTo(b.rating));
    }
    return reviews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => context.router.maybePop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(kReviewsTitle, style: textHeader4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.router.push(const NotificaitonRoute()),
                    child: SvgPicture.asset(
                      kNotificaitonIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: kGrey200),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _averageRating.toStringAsFixed(1),
                          style: textHeader1,
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBarIndicator(
                              rating: _averageRating,
                              itemCount: 5,
                              itemSize: 28,
                              unratedColor: kGrey200,
                              itemBuilder: (context, index) =>
                                  const Icon(Icons.star, color: Colors.amber),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$_totalRatings Ratings',
                              style: textBody1.copyWith(color: kGrey600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    for (final bar in _ratingBreakdown) ...[
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: bar.stars.toDouble(),
                            itemCount: 5,
                            itemSize: 20,
                            unratedColor: kGrey200,
                            itemBuilder: (context, index) =>
                                const Icon(Icons.star, color: Colors.amber),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: bar.fraction,
                                minHeight: 8,
                                backgroundColor: kGrey200,
                                valueColor: const AlwaysStoppedAnimation(
                                  kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_reviews.length} Reviews',
                          style: textBody1SemiBold,
                        ),
                        PopupMenuButton<ReviewSortOption>(
                          color: kWhiteColor,
                          initialValue: _selectedSort,
                          onSelected: (option) =>
                              setState(() => _selectedSort = option),
                          offset: const Offset(0, 28),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          itemBuilder: (context) => ReviewSortOption.values
                              .map(
                                (option) => PopupMenuItem(
                                  value: option,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        option.label,
                                        style: option == _selectedSort
                                            ? textBody2SemiBold
                                            : textBody2,
                                      ),
                                      if (option == _selectedSort) ...[
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
                                _selectedSort.label,
                                style: textBody2.copyWith(color: kGrey600),
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
                    for (final review in _sortedReviews) ...[
                      const SizedBox(height: 20),
                      RatingBarIndicator(
                        rating: review.rating,
                        itemSize: 20,
                        unratedColor: kGrey200,
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.amber),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        review.comment,
                        style: textBody2.copyWith(color: kGrey600),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(review.name, style: textBody2SemiBold),
                          Text(
                            ' • ${review.timeAgoText}',
                            style: textBody2.copyWith(color: kGrey600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(height: 1, color: kGrey200),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
