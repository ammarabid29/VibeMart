import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference itemsCollection = FirebaseFirestore.instance
    .collection("items");
final CollectionReference categoriesCollection = FirebaseFirestore.instance
    .collection("categories");
