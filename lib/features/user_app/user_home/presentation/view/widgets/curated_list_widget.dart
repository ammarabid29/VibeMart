import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/shop_item_model.dart';

class CuratedListWidget extends StatelessWidget {
  final ShopItemModel shopItem;
  const CuratedListWidget({super.key, required this.shopItem});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              image: AssetImage(shopItem.image),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
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
              "${shopItem.rating}",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
              ),
            ),
            Text(
              "(${shopItem.review})",
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
          shopItem.name,
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
              "\$${shopItem.price}.00",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: 1.5,
                color: Colors.pink,
              ),
            ),
            SizedBox(width: 4.h),
            if (shopItem.isCheck)
              Text(
                "\$${shopItem.price + 200}.00",
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
