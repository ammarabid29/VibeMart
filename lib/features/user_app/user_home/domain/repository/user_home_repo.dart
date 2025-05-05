import 'package:vibemart/features/user_app/user_home/domain/models/category_model.dart';

abstract class UserHomeRepo {
  Stream<List<CategoryModel>> getCategories();
}
