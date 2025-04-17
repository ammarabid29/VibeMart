import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/home/domain/models/category_model.dart';

class CategoriesListItem extends StatelessWidget {
  final CategoryModel categoryItem;
  const CategoriesListItem({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: kCardColor,
            backgroundImage: AssetImage(categoryItem.image),
          ),
        ),
        SizedBox(height: 2.h),
        Text(categoryItem.name),
      ],
    );
  }
}
