import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';

class UserHomeSource {
  Stream<List<CategoryModel>> getCategoryStream() {
    return FirebaseFirestore.instance.collection("categories").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc.data());
      }).toList();
    });
  }

  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance.collection("items").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return ItemModel.fromJson(doc.data());
      }).toList();
    });
  }
}
