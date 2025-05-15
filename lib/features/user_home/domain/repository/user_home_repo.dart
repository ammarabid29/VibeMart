import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';

abstract class UserHomeRepo {
  Stream<List<CategoryModel>> getCategories();

  Stream<List<ItemModel>> getItems();
}
