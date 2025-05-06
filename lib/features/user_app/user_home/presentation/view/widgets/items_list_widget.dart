import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_card.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view/widgets/item_details_view.dart';
import 'package:vibemart/features/user_app/user_home/presentation/view_model/user_home_view_model.dart';

class ItemsListWidget extends ConsumerWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(itemStreamProvider);

    return itemsAsync.when(
      data: (items) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              items.length,
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
                            (ctx) => ItemDetailsView(itemModel: items[index]),
                      ),
                    );
                  },
                  child: ItemCard(item: items[index]),
                ),
              ),
            ),
          ),
        );
      },
      error: (error, _) => Center(child: Text('Error: ${error}')),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}
