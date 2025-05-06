import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/item_model.dart';

class ItemDetailsView extends StatefulWidget {
  final ItemModel itemModel;

  const ItemDetailsView({super.key, required this.itemModel});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double discountedPrice =
        widget.itemModel.isDiscounted
            ? widget.itemModel.price -
                (widget.itemModel.price *
                    widget.itemModel.discountPercentage /
                    100)
            : widget.itemModel.price.toDouble();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Iconsax.shopping_bag, size: 28.sp, color: Colors.black),
                Positioned(
                  right: -3,
                  top: -5,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: kErrorColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kCardColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.network(
            widget.itemModel.imageUrl,
            height: 300.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Details
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating + Favorite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "H&M",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(Icons.star, color: Colors.amber, size: 16.sp),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "(45)",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20.r,
                        child: Icon(
                          Icons.favorite_outline,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),

                  // Name
                  SizedBox(height: 8.h),
                  Text(
                    widget.itemModel.name,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Price
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
                      SizedBox(width: 8.w),
                      if (widget.itemModel.isDiscounted)
                        Text(
                          "\$${widget.itemModel.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.black26,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Sizes & Colors
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Sizes
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sizes",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                    widget.itemModel.size.asMap().entries.map((
                                      entry,
                                    ) {
                                      final index = entry.key;
                                      final size = entry.value;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedSizeIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: 35.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                selectedSizeIndex == index
                                                    ? Colors.black
                                                    : kBackgroundColor,
                                            border: Border.all(
                                              color:
                                                  selectedSizeIndex == index
                                                      ? Colors.black
                                                      : Colors.black12,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    selectedSizeIndex == index
                                                        ? kBackgroundColor
                                                        : Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 12.w),

                      // Colors
                      // Colors
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Colors",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:
                                    widget.itemModel.color.asMap().entries.map((
                                      entry,
                                    ) {
                                      final index = entry.key;
                                      final colorName = entry.value;

                                      final isSelected =
                                          selectedColorIndex == index;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColorIndex = index;
                                          });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 8.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                isSelected
                                                    ? Colors.black
                                                    : kBackgroundColor,
                                            border: Border.all(
                                              color:
                                                  isSelected
                                                      ? Colors.black
                                                      : Colors.black12,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          child: Text(
                                            colorName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Buttons
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  foregroundColor: kBackgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Text("Add to Cart", style: TextStyle(fontSize: 16.sp)),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: kCardColor,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Text("Buy Now", style: TextStyle(fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
