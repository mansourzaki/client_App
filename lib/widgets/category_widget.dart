import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../providers/firestore_provider.dart';
import '../router.dart';
import '../screens/all_products_screen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () async {
            // AppRouter.NavigateToWidget(AddProductScreen(
            //   category: category,
            // ));
            context
                .read<FireStoreProvider>()
                .getAllProductsFromCategory(category.id!);
            AppRouter.NavigateToWidget(AllProductsScreen(
              category: category,
            ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.width / 2) - 70,
                width: double.infinity,
                child: Stack(children: [
                  Container(
                    width: double.infinity,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: category.imageUrl,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                ]),
              ),
              ListTile(
                title: Text(
                  category.name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
