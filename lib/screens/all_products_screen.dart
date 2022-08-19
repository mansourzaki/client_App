import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../providers/firestore_provider.dart';
import '../router.dart';
import '../widgets/product_widget.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key, required this.category}) : super(key: key);
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: Consumer<FireStoreProvider>(
        builder: ((context, provider, child) => provider.categories == null
            ? const CircularProgressIndicator()
            : GridView.builder(
                itemCount: provider.products.length,
                itemBuilder: (context, i) => PProcuctWidget(
                    product: provider.products[i], category: category),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 8, left: 6, right: 6, bottom: 12),
              )),
      ),
    );
  }
}
