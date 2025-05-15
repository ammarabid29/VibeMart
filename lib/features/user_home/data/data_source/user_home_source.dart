import 'package:vibemart/core/commons/common_data_source/common_data_source.dart';
import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';

class UserHomeSource {
  Stream<List<CategoryModel>> getCategoryStream() {
    return categoriesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<ItemModel>> getItemsStream() {
    return itemsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ItemModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
