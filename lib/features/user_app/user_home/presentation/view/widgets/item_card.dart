import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final double originalPrice = item.price.toDouble();
    final double discountedPrice =
        item.isDiscounted
            ? originalPrice * (1 - item.discountPercentage / 100)
            : originalPrice;

    return Column(
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
              image: NetworkImage(item.imageUrl),
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
              "4.5", // placeholder rating
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Text(
              "(120)", // placeholder review count
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
          item.name,
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
            if (item.isDiscounted)
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
    );
  }
}
