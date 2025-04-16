import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';

class CustomListTile extends StatelessWidget {
  final ItemModel item;
  const CustomListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kCardColor,
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: item.imageUrl,
          width: 50.w,
          height: 50.h,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text("Category: ${item.category}\nPrice: ₹${item.price}"),
        trailing:
            item.isDiscounted
                ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "-${item.discountPercentage}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                : null,
      ),
    );
  }
}
