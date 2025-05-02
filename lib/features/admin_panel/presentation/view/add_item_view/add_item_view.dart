import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:vibemart/core/colors/colors.dart';
import 'package:vibemart/core/commons/common_app_bar.dart';
import 'package:vibemart/core/commons/common_button.dart';
import 'package:vibemart/core/commons/common_dropdown.dart';
import 'package:vibemart/core/commons/common_text_field.dart';
import 'package:vibemart/core/commons/custom_toasts.dart';
import 'package:vibemart/features/admin_panel/presentation/view_model/add_item_view_model/add_item_state.dart';
import 'package:vibemart/features/admin_panel/presentation/view_model/add_item_view_model/add_item_view_model.dart';

final addItemProvider = StateNotifierProvider<AddItemViewModel, AddItemState>((
  ref,
) {
  return AddItemViewModel();
});

class AddItemView extends ConsumerWidget {
  AddItemView({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _discountPerController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addItemProvider);
    final notifier = ref.read(addItemProvider.notifier);

    return Scaffold(
      appBar: CommonAppBar(title: "Add New Items"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              Center(
                child: Container(
                  height: 130.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:
                      state.imagePath != null
                          ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              File(state.imagePath!),
                              fit: BoxFit.cover,
                            ),
                          )
                          : state.isLoading
                          ? CircularProgressIndicator()
                          : GestureDetector(
                            onTap: notifier.pickImage,
                            child: Icon(Icons.camera_alt, size: 30),
                          ),
                ),
              ),
              SizedBox(height: 10.h),
              // item name
              CommonTextField(text: "Name", controller: _nameController),
              SizedBox(height: 10.h),
              // item price
              CommonTextField(text: "Price", controller: _priceController),
              SizedBox(height: 10.h),
              // category
              CommonDropdown(
                value: state.selectedCategory,
                label: "Select Category",
                items:
                    state.categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  notifier.setSelectedCategory(newValue);
                },
              ),
              SizedBox(height: 10.h),
              // sizes
              CommonTextField(
                text: "Sizes",
                controller: _sizeController,
                onSubmitted: (value) {
                  notifier.addSize(value);
                  _sizeController.clear();
                },
              ),
              // sizes list
              Wrap(
                spacing: 8,
                children:
                    state.sizes
                        .map(
                          (size) => Chip(
                            onDeleted: () => notifier.removeSize(size),
                            label: Text(size.toString()),
                          ),
                        )
                        .toList(),
              ),
              SizedBox(height: 10.h),
              // colors
              CommonTextField(
                text: "Colors",
                controller: _colorController,
                onSubmitted: (value) {
                  notifier.addColor(value);
                  _colorController.clear();
                },
              ),
              // colors list
              Wrap(
                spacing: 8,
                children:
                    state.colors
                        .map(
                          (color) => Chip(
                            onDeleted: () => notifier.removeColor(color),
                            label: Text(color.toString()),
                          ),
                        )
                        .toList(),
              ),
              // discount checkbox
              Row(
                children: [
                  Checkbox(
                    activeColor: kPrimaryColor,
                    value: state.isDiscounted,
                    onChanged: notifier.toggleDiscount,
                    side: BorderSide(color: kPrimaryColor, width: 2),
                  ),
                  Text(
                    "Apply Discount",
                    style: TextStyle(color: kPrimaryColor, fontSize: 16),
                  ),
                ],
              ),
              if (state.isDiscounted)
                // discount percentage
                CommonTextField(
                  text: "Discount Percentage (%)",
                  controller: _discountPerController,
                  onSubmitted: (value) {
                    notifier.setDiscountPercentage(value);
                  },
                ),
              SizedBox(height: 10.h),
              // submit button
              Center(
                child: CommonButton(
                  text: "Add Item",
                  isLoading: state.isLoading,
                  onPressed: () async {
                    print(state.imagePath);
                    print(_nameController.text);
                    print(_priceController.text);
                    print(state.selectedCategory);
                    print(state.sizes);
                    print(state.colors);
                    print(state.isDiscounted);
                    print(state.discountPercentage);
                    try {
                      await notifier.uploadAndSaveItem(
                        _nameController.text,
                        _priceController.text,
                      );
                      showSuccessToast("Item added successfully!");
                      Navigator.pop(context);
                    } catch (e) {
                      showErrorToast("Error: $e");
                    }
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
