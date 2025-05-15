import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/presentation/view/widgets/category_items_view.dart';
import 'package:vibemart/features/user_home/presentation/view_model/user_home_view_model.dart';

final categoryStreamProvider = StreamProvider<List<CategoryModel>>((ref) {
  final UserHomeViewModel viewModel = UserHomeViewModel();
  return viewModel.getCategories();
});

class CategoryListWidget extends ConsumerWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryStreamProvider);
    final itemsAsync = ref.watch(itemStreamProvider);

    return itemsAsync.when(
      data: (itemsList) {
        return categoriesAsync.when(
          data: (categoriesList) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categoriesList.length,
                  (index) => InkWell(
                    onTap: () {
                      final filteredItems =
                          itemsList
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
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: kCardColor,
                            backgroundImage: NetworkImage(
                              categoriesList[index].image,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(categoriesList[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, _) => Center(child: Text('Error: ${error}')),
          loading: () => Center(child: CircularProgressIndicator()),
        );
      },
      error: (error, _) => Center(child: Text('Error: ${error}')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
