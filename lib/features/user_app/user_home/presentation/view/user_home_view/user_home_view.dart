import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/shop_item_model.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/category_items_view/category_items_view.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/item_details_view/item_details_view.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/user_home_view/widgets/categories_list_item.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/user_home_view/widgets/custom_banner.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/curated_list_item.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/custom_heading.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key});

  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            // app bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/app_logo.png", height: 60),
                  // shopping cart Icon
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Iconsax.shopping_bag, size: 28.sp),
                      Positioned(
                        right: -3,
                        top: -5,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kErrorColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kCardColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // main body
            SizedBox(height: 5.h),
            // banner
            CustomBanner(),
            CustomHeading(text: "Shop By Category"),
            // Categories List View
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categoriesList.length,
                  (index) => InkWell(
                    onTap: () {
                      final filteredItems =
                          shopItemsList
                              .where(
                                (item) =>
                                    item.category.toLowerCase() ==
                                    categoriesList[index].name.toLowerCase(),
                              )
                              .toList();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (ctx) => CategoryItemsView(
                                categoryShopItems: filteredItems,
                                category: categoriesList[index].name,
                              ),
                        ),
                      );
                    },
                    child: CategoriesListItem(
                      categoryItem: categoriesList[index],
                    ),
                  ),
                ),
              ),
            ),
            CustomHeading(text: "Curated For You"),
            // Curated for you List View
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  shopItemsList.length,
                  (index) => Padding(
                    padding:
                        index == 0
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (ctx) => ItemDetailsView(
                                  shopItemModel: shopItemsList[index],
                                ),
                          ),
                        );
                      },
                      child: CuratedListItem(shopItem: shopItemsList[index]),
                    ),
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
