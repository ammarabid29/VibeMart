import 'package:vibemart/features/user_app/user_home/data/repository/user_home_repo_impl.dart';
import 'package:vibemart/features/user_app/user_home/domain/models/category_model.dart';
import 'package:vibemart/features/user_app/user_home/domain/repository/user_home_repo.dart';

class UserHomeViewModel {
  final UserHomeRepo _userHomeRepo = UserHomeRepoImpl();

  Stream<List<CategoryModel>> getCategories() {
    return _userHomeRepo.getCategories();
  }
}
