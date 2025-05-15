import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:vibemart/core/commons/common_data_source/common_data_source.dart';
import 'package:vibemart/features/admin_panel/domain/model/item_model.dart';
import 'package:vibemart/features/auth/presentation/view/login/login_view.dart';

class FirebaseItemsSource {
  // pick image from gallery
  Future<String?> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        return pickedFile.path;
      }
      return null;
    } catch (e) {
      throw Exception("Error in picking image: $e");
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await categoriesCollection.get();

      return snapshot.docs.map((doc) => doc["name"] as String).toList();
    } catch (_) {
      rethrow;
    }
  }

  // upload image to ImgBB
  Future<String> uploadImageToImgBB(String imagePath) async {
    try {
      const String apiKey = '72c2acc6990163bc4204a93c8fd2dbec';
      final Uri url = Uri.parse('https://api.imgbb.com/1/upload?key=$apiKey');

      final base64Image = base64Encode(File(imagePath).readAsBytesSync());

      final response = await http.post(url, body: {'image': base64Image});

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['data']['url'];
      } else {
        throw Exception(
          'Image upload failed with status: ${response.statusCode}',
        );
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> uploadItemToFireStore(ItemModel item) async {
    try {
      await itemsCollection.add(item.toMap());
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logoutAdmin(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginView()));
    } catch (_) {
      rethrow;
    }
  }
}
