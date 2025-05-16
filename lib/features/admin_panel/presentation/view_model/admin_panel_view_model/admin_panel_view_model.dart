import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:vibemart/core/commons/common_widgets/custom_toasts.dart';

import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/admin_panel/data/repository/admin_repo_impl.dart';

class AdminPanelState {
  final List<String> categories;
  final String? selectedCategory;

  AdminPanelState({this.categories = const [], this.selectedCategory});

  AdminPanelState copyWith({
    List<String>? categories,
    String? selectedCategory,
  }) {
    return AdminPanelState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class AdminPanelViewModel extends StateNotifier<AdminPanelState> {
  final _repo = AdminRepoImpl();
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  AdminPanelViewModel() : super(AdminPanelState()) {
    fetchCategories();
  }

  void selectCategory(String? category) {
    state = state.copyWith(selectedCategory: category);
  }

  Future<void> fetchCategories() async {
    try {
      final cats = await _repo.fetchCategories();
      state = state.copyWith(categories: cats);
    } catch (e) {
      print("Error fetching categories: $e");
    }
  }

  Stream<List<ItemModel>> getItemsStream() {
    var query = FirebaseFirestore.instance
        .collection("items")
        .where("uploadedBy", isEqualTo: uid);
    if (state.selectedCategory != null) {
      query = query.where("category", isEqualTo: state.selectedCategory);
    }
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ItemModel.fromMap(doc.data())).toList();
    });
  }

  Future<void> logoutAdmin(BuildContext context) async {
    try {
      await _repo.logoutAdmin(context);
      showSuccessToast("Logout Successfully");
    } on FirebaseAuthException catch (e) {
      // Display Firebase-specific error message in a popup
      showErrorToast(e.message ?? 'Logout error occurred.');
    } catch (e) {
      // Display generic error message in a popup
      showErrorToast('An unexpected error occurred. Please try again.');
    }
  }
}
