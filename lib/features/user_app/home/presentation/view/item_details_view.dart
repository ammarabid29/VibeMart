import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/home/domain/models/shop_item_model.dart';

class ItemDetailsView extends StatefulWidget {
  final ShopItemModel shopItemModel;

  const ItemDetailsView({super.key, required this.shopItemModel});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            widget.shopItemModel.image,
            height: 300.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // details
          SingleChildScrollView(
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
                          "${widget.shopItemModel.rating}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                        Text(
                          "(${widget.shopItemModel.review})",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.r,
                      child: Icon(Icons.favorite_outline, color: kPrimaryColor),
                    ),
                  ],
                ),

                // Title
                Text(
                  widget.shopItemModel.name,
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
                      "\$${widget.shopItemModel.price}.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        height: 1.5,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(width: 4.h),
                    if (widget.shopItemModel.isCheck)
                      Text(
                        "\$${widget.shopItemModel.price + 200}.00",
                        style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black26,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8.h),

                // Description
                Text(
                  widget.shopItemModel.description,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                SizedBox(height: 8.h),

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
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  widget.shopItemModel.size.asMap().entries.map(
                                    (s) {
                                      final int index = s.key;
                                      final size = s.value;
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
                                    },
                                  ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Colors
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colors",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  widget.shopItemModel.fColor
                                      .asMap()
                                      .entries
                                      .map((s) {
                                        final int index = s.key;
                                        final color = s.value;
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                          ),
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: color,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedColorIndex = index;
                                                });
                                              },
                                              child: Icon(
                                                Icons.check,
                                                color:
                                                    selectedColorIndex == index
                                                        ? kBackgroundColor
                                                        : Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                      .toList(),
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
        ],
      ),

      // actions buttons
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
                onPressed: () {
                  // Add to cart action
                },
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
                onPressed: () {
                  // Buy now action
                },
                child: Text("Buy Now", style: TextStyle(fontSize: 16.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
