import 'package:flutter/material.dart';
import 'package:vibemart/features/admin_panel/data/data_source/admin_panel_source.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/domain/repository/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final AdminPanelSource _adminPanelSource = AdminPanelSource();

  @override
  Future<List<String>> fetchCategories() async {
    try {
      return await _adminPanelSource.fetchCategories();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> pickImage() async {
    try {
      return await _adminPanelSource.pickImage();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> uploadImageToImgBB(String imagePath) async {
    try {
      return await _adminPanelSource.uploadImageToImgBB(imagePath);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> uploadItemToFireStore(ItemModel item) async {
    try {
      return await _adminPanelSource.uploadItemToFireStore(item);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> logoutAdmin(BuildContext context) async {
    try {
      await _adminPanelSource.logoutAdmin(context);
    } catch (_) {
      rethrow;
    }
  }
}
