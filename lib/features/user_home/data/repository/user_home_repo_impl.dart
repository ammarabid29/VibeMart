import 'package:vibemart/features/user_home/data/data_source/firebase_data_source.dart';
import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';
import 'package:vibemart/features/user_home/domain/repository/user_home_repo.dart';

class UserHomeRepoImpl implements UserHomeRepo {
  final FirebaseDataSource _firebaseDataSource = FirebaseDataSource();

  @override
  Stream<List<CategoryModel>> getCategories() {
    return _firebaseDataSource.getCategoryStream();
  }

  @override
  Stream<List<ItemModel>> getItems() {
    return _firebaseDataSource.getItemsStream();
  }
}
