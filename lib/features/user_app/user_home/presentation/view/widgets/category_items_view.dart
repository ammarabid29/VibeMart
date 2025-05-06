import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/item_model.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_card.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_details_view.dart';

class CategoryItemsView extends StatefulWidget {
  final List<ItemModel> categoryShopItems;
  final String category;
  const CategoryItemsView({
    super.key,
    required this.categoryShopItems,
    required this.category,
  });

  @override
  State<CategoryItemsView> createState() => _CategoryItemsViewState();
}

class _CategoryItemsViewState extends State<CategoryItemsView> {
  final TextEditingController searchController = TextEditingController();
  List<ItemModel> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = widget.categoryShopItems;
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredList =
          widget.categoryShopItems.where((item) {
            return item.name.toLowerCase().contains(query);
          }).toList();
    });
  }

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
                        controller: searchController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "${widget.category}'s Fashion",
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
                  filteredList.isEmpty
                      ? Center(child: Text("No Items available to show"))
                      : GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder:
                            (ctx, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (ctx) => ItemDetailsView(
                                          itemModel: filteredList[index],
                                        ),
                                  ),
                                );
                              },
                              child: ItemCard(item: filteredList[index]),
                            ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
