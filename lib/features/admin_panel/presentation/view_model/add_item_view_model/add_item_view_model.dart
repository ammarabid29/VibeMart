import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibemart/features/admin_panel/data/repository/admin_repo_impl.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/domain/repository/admin_repo.dart';
import 'package:vibemart/features/admin_panel/presentation/view_model/add_item_view_model/add_item_state.dart';

class AddItemViewModel extends StateNotifier<AddItemState> {
  AddItemViewModel() : super(AddItemState()) {
    fetchCategory();
  }

  final AdminRepo _adminRepo = AdminRepoImpl();

  // pick image from gallery and add in state
  void pickImage() async {
    try {
      final pickedFile = await _adminRepo.pickImage();
      if (pickedFile != null) {
        state = state.copyWith(imagePath: pickedFile);
      }
    } catch (e) {
      throw Exception("Error in picking image $e");
    }
  }

  // add selectedCategory in state
  void setSelectedCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
  }

  // add size in state
  void addSize(String size) {
    state = state.copyWith(sizes: [...state.sizes, size]);
  }

  // remove size from state
  void removeSize(String size) {
    state = state.copyWith(sizes: state.sizes.where((s) => s != size).toList());
  }

  // add color in state
  void addColor(String color) {
    state = state.copyWith(colors: [...state.colors, color]);
  }

  // remove color from state
  void removeColor(String color) {
    state = state.copyWith(
      colors: state.colors.where((c) => c != color).toList(),
    );
  }

  // toggle discount status in state
  void toggleDiscount(bool? isDiscounted) {
    state = state.copyWith(isDiscounted: isDiscounted);
  }

  // set discount percentage in state
  void setDiscountPercentage(String percentage) {
    state = state.copyWith(discountPercentage: percentage);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  // fetch categories list from firebase and add in state
  Future<void> fetchCategory() async {
    try {
      List<String> categories = await _adminRepo.fetchCategories();
      state = state.copyWith(categories: categories);
    } catch (e) {
      throw Exception("Error in fetching category $e");
    }
  }

  // save image in ImgBB and item details in firebase fire_store
  Future<void> uploadAndSaveItem(String name, String price) async {
    if (name.isEmpty ||
        price.isEmpty ||
        state.imagePath == null ||
        state.selectedCategory == null ||
        state.sizes.isEmpty ||
        state.colors.isEmpty ||
        (state.isDiscounted && state.discountPercentage == null)) {
      throw Exception("Please Fill all the fields and then upload.");
    }
    state = state.copyWith(isLoading: true);
    try {
      // Upload image to ImgBB
      final imageUrl = await _adminRepo.uploadImageToImgBB(state.imagePath!);

      // save items to fire_store
      final String uid = FirebaseAuth.instance.currentUser!.uid;

      final item = ItemModel(
        name: name,
        price: int.tryParse(price) ?? 0,
        imageUrl: imageUrl,
        uploadedBy: uid,
        category: state.selectedCategory!,
        size: state.sizes,
        color: state.colors,
        isDiscounted: state.isDiscounted,
        discountPercentage:
            state.isDiscounted
                ? int.tryParse(state.discountPercentage!) ?? 0
                : 0,
      );
      print(item);
      await _adminRepo.uploadItemToFireStore(item);

      // clear state after uploading item details
      state = AddItemState();
    } catch (e) {
      throw Exception("Error saving item: $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
