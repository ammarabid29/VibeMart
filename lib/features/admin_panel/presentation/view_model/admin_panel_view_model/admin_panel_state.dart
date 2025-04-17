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
