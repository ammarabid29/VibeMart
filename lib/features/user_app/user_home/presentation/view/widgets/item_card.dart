import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/item_model.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_details_view.dart';

class ItemCard extends StatefulWidget {
  final ItemModel item;
  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late double randomRating;
  late int randomReviews;

  @override
  void initState() {
    super.initState();
    final random = Random();
    randomRating = (random.nextDouble() * 2) + 3; // Rating between 3.0 - 5.0
    randomRating = double.parse(randomRating.toStringAsFixed(1)); // 1 decimal
    randomReviews = random.nextInt(100) + 20; // Reviews between 20 - 119
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double originalPrice = widget.item.price.toDouble();
    final double discountedPrice =
        widget.item.isDiscounted
            ? originalPrice * (1 - widget.item.discountPercentage / 100)
            : originalPrice;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (ctx) => ItemDetailsView(
                  itemModel: widget.item,
                  randomRating: randomRating,
                  randomReviews: randomReviews,
                ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.20,
            width: size.width * 0.5,
            decoration: BoxDecoration(
              color: kCardColor,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.item.imageUrl),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: kCardColor,
                  radius: 18,
                  child: Icon(Icons.favorite_border, color: kPrimaryColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                "H&M",
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
              SizedBox(width: 8.w),
              Icon(Icons.star, color: Colors.amber, size: 16.sp),
              Text(
                randomRating.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0,
                ),
              ),
              Text(
                "($randomReviews)",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            widget.item.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Text(
                "\$${discountedPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  height: 1.5,
                  color: Colors.pink,
                ),
              ),
              SizedBox(width: 4.w),
              if (widget.item.isDiscounted)
                Text(
                  "\$${originalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.black26,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.black26,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
