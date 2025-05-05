import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vibemart/features/user_app/user_home/domain/models/shop_item_model.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_card.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_details_view.dart';

class ItemsListWidget extends ConsumerWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
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
              child: ItemCard(shopItem: shopItemsList[index]),
            ),
          ),
        ),
      ),
    );
  }
}
