import 'package:flutter/material.dart';
import 'package:vibemart/features/admin_panel/data/data_source/firebase_items_source.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/domain/repository/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final FirebaseItemsSource _firebaseItemsSource = FirebaseItemsSource();

  @override
  Future<List<String>> fetchCategories() async {
    try {
      return await _firebaseItemsSource.fetchCategories();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> pickImage() async {
    try {
      return await _firebaseItemsSource.pickImage();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> uploadImageToImgBB(String imagePath) async {
    try {
      return await _firebaseItemsSource.uploadImageToImgBB(imagePath);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> uploadItemToFireStore(ItemModel item) async {
    try {
      return await _firebaseItemsSource.uploadItemToFireStore(item);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logoutAdmin(BuildContext context) async {
    try {
      await _firebaseItemsSource.logoutAdmin(context);
    } catch (_) {
      rethrow;
    }
  }
}
