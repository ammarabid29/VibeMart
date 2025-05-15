import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vibemart/features/user_home/data/repository/user_home_repo_impl.dart';
import 'package:vibemart/features/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_home/domain/models/item_model.dart';
import 'package:vibemart/features/user_home/domain/repository/user_home_repo.dart';

final itemStreamProvider = StreamProvider<List<ItemModel>>((ref) {
  final UserHomeViewModel viewModel = UserHomeViewModel();
  return viewModel.getItems();
});

class UserHomeViewModel {
  final UserHomeRepo _userHomeRepo = UserHomeRepoImpl();

  Stream<List<CategoryModel>> getCategories() {
    return _userHomeRepo.getCategories();
  }

  Stream<List<ItemModel>> getItems() {
    return _userHomeRepo.getItems();
  }
}
