import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/category_list_widget.dart';
import 'package:vibemart/core/commons/common_widgets/custom_banner.dart';
import 'package:vibemart/core/commons/common_widgets/custom_heading.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/items_list_widget.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

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
                  InkWell(
                    onTap: () {
                      // FirebaseAuth.instance.signOut();
                    },
                    child: Stack(
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
            CategoryListWidget(),
            CustomHeading(text: "Curated For You"),
            // Items List View
            ItemsListWidget(),
          ],
        ),
      ),
    );
  }
}
