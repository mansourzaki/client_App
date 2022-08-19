import 'package:admin_app/screens/product_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../providers/firestore_provider.dart';
import '../router.dart';

class PProcuctWidget extends StatelessWidget {
  const PProcuctWidget(
      {Key? key, required this.product, required this.category})
      : super(key: key);
  final Product product;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          AppRouter.NavigateToWidget(Productdetails(product: product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 100,
                    //  placeholderFadeInDuration: Duration(seconds: 1),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    imageUrl: product.image,
                  ),
                ),
              ]),
            ),
            ListTile(
              title: Text(
                product.name,
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Row(
                children: [
                  Text('\$${product.price.toString()}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w700)),
                  Spacer(),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.add_shopping_cart))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
