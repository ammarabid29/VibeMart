import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/core/commons/common_widgets/common_app_bar.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/presentation/view/add_item_view/add_item_view.dart';
import 'package:vibemart/features/admin_panel/presentation/view/widgets/custom_list_tile.dart';
import 'package:vibemart/features/admin_panel/presentation/view_model/admin_panel_view_model/admin_panel_state.dart';
import 'package:vibemart/features/admin_panel/presentation/view_model/admin_panel_view_model/admin_panel_view_model.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

final adminPanelProvider =
    StateNotifierProvider<AdminPanelViewModel, AdminPanelState>(
      (ref) => AdminPanelViewModel(),
    );

class AdminPanelView extends ConsumerWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminPanelProvider);
    final notifier = ref.read(adminPanelProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(
        title: "Your Uploaded Items",
        actions: [
          // show total orders
          Stack(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.receipt_long)),
              Positioned(
                top: 6,
                right: 8,
                child: CircleAvatar(
                  radius: 9.r,
                  backgroundColor: kErrorColor,
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(color: kBackgroundColor, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Logout Button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(
                context,
              ).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
            },
          ),
        ],
        //
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.tune, color: kCardColor),
          onSelected: notifier.selectCategory,
          itemBuilder: (context) {
            return state.categories.map((cat) {
              return PopupMenuItem(value: cat, child: Text(cat));
            }).toList();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kBackgroundColor,
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => AddItemView()));
        },
      ),
      body: StreamBuilder<List<ItemModel>>(
        stream: notifier.getItemsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error loading items"));
          }
          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return Center(child: Text("No item added. Try adding some!"));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, index) => CustomListTile(item: items[index]),
          );
        },
      ),
    );
  }
}
