import 'dart:developer';

import 'package:flutter/material.dart';

import '../helpers/firestore_helper.dart';
import '../models/category.dart';
import '../models/product.dart';

class FireStoreProvider extends ChangeNotifier {
  List<Category>? categories = [];
  List<Product> products = [];
  List<Product>? allproducts = [];
  List<String> imagesCarousal = [];
  int cartQty = 0;
  FireStoreProvider() {
    getAllCategory();
    getEveryProduct();
  }

  addCategory(Category category) async {
    Category newCat =
        await FirestoreHelper.firestoreHelper.addCategory(category);
    categories!.add(newCat);
    notifyListeners();
  }

  updateCategory(Category category) async {
    print(category.id);
    await FirestoreHelper.firestoreHelper.updateCategory(category);
    // getAllCategory();
    int x = categories!.indexWhere((element) => category.id == element.id);
    categories![x] = category;
    // categories!.removeWhere((element) => category.id == element.id);
    // categories!.add(category);
    // notifyListeners();
  }

  deletCategory(Category category) async {
    await FirestoreHelper.firestoreHelper.deleteCategory(category);
    categories!.removeWhere(
      (element) => element.id == category.id,
    );
    log('deleted');
    notifyListeners();
  }

  getAllCategory() async {
    categories = (await FirestoreHelper.firestoreHelper.getAllCategories())
        .cast<Category>();
    print(categories!.length);
    print(categories!);
    notifyListeners();
  }

  getEveryProduct() async {
    allproducts = await FirestoreHelper.firestoreHelper.getEveryProduct();
    notifyListeners();
  }

  getAllProductsFromCategory(String catId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProducts(catId);
    notifyListeners();
  }

  addProduct(Product product, String catId) async {
    Product newProd =
        await FirestoreHelper.firestoreHelper.addNewProduct(product, catId);
    products.add(newProd);
    notifyListeners();
  }

  updateProduct(Product product, String catId) async {
    print(product.id);
    await FirestoreHelper.firestoreHelper.updateProduct(product, catId);
    // getAllProducts();
    int x = products.indexWhere((element) => product.id == element.id);
    products[x] = product;
  }

  deletProduct(Product product, String catId) async {
    await FirestoreHelper.firestoreHelper.deleteProduct(product, catId);
    products.removeWhere(
      (element) => element.id == product.id,
    );
    log('deleted');
    notifyListeners();
  }
}
