import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';

abstract class AdminRepo {
  Future<void> uploadItemToFireStore(ItemModel item);
  Future<String> uploadImageToImgBB(String imagePath);
  Future<List<String>> fetchCategories();
  Future<String?> pickImage();
}
