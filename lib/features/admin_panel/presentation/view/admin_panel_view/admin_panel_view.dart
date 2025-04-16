import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/core/commons/common_app_bar.dart';
import 'package:vibemart/features/admin_panel/data/data_source/firebase_items_source.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/presentation/view/add_item_view/add_item_view.dart';
import 'package:vibemart/features/admin_panel/presentation/view/widgets/custom_list_tile.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class AdminPanelView extends StatelessWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuEntry>? menuItems = [
      PopupMenuItem(value: 'a', child: Text('A')),
      PopupMenuItem(value: 'b', child: Text('B')),
    ];

    final selectedCategory = [];
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: CommonAppBar(
        title: "Your Uploaded Items",
        actions: [
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
        leading: PopupMenuButton(
          onSelected: (value) {
            if (value == "a") {
              print("clicked a");
            } else if (value == "b") {
              print("clicked b");
            }
          },
          icon: const Icon(Icons.more_vert),
          itemBuilder: (context) => menuItems ?? [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: kCardColor,
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => AddItemView()));
        },
      ),
      body: StreamBuilder(
        stream:
            FirebaseItemsSource().itemsCollection
                .where("uploadedBy", isEqualTo: uid)
                .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error loading items"));
          }
          final documents = snapshot.data?.docs ?? [];
          if (documents.isEmpty) {
            return Center(child: Text("No item added. Try adding some!"));
          }
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final item = ItemModel.fromMap(
                documents[index].data() as Map<String, dynamic>,
              );
              return CustomListTile(item: item);
            },
            itemCount: documents.length,
          );
        },
      ),
    );
  }
}
