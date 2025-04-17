import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/home/domain/models/category_model.dart';
import 'package:vibemart/features/user_app/home/domain/models/shop_item_model.dart';
import 'package:vibemart/features/user_app/home/presentation/view/item_details_view.dart';
import 'package:vibemart/features/user_app/home/presentation/view/widgets/curated_list_item.dart';

class CategoryItemView extends StatelessWidget {
  final List<ShopItemModel> categoryItems;
  final String category;
  const CategoryItemView({
    super.key,
    required this.categoryItems,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Appbar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              // App Bar
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "$category's Fashion",
                          hintStyle: TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: kGrayLight,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(
                            Iconsax.search_normal,
                            color: Colors.black38,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            // Filters List
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index]),
                            SizedBox(width: 5.w),
                            index == 0
                                ? Icon(Icons.filter_list)
                                : Icon(Icons.keyboard_arrow_down, size: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Main Body
            Expanded(
              child:
                  categoryItems.isEmpty
                      ? Center(child: Text("No Items available to show"))
                      : GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: categoryItems.length,
                        itemBuilder:
                            (ctx, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (ctx) => ItemDetailsView(
                                          shopItemModel: categoryItems[index],
                                        ),
                                  ),
                                );
                              },
                              child: CuratedListItem(
                                eCommerceItem: categoryItems[index],
                              ),
                            ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
