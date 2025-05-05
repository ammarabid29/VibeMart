import 'package:vibemart/core/commons/common_data_source/common_data_source.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/category_model.dart';

class FirebaseDataSource {
  Stream<List<CategoryModel>> getCategoryStream() {
    return categoriesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // Stream<List<CategoryModel>> getItemsStream() {
  //   return itemsCollection.snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //        Todo
  //       return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //   });
  // }
}
