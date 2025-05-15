import 'package:vibemart/features/user_home/data/data_source/user_home_source.dart';
import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';
import 'package:vibemart/features/user_home/domain/repository/user_home_repo.dart';

class UserHomeRepoImpl implements UserHomeRepo {
  final UserHomeSource _userHomeSource = UserHomeSource();

  @override
  Stream<List<CategoryModel>> getCategories() {
    return _userHomeSource.getCategoryStream();
  }

  @override
  Stream<List<ItemModel>> getItems() {
    return _userHomeSource.getItemsStream();
  }
}
