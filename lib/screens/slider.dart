import 'dart:developer';

import 'package:admin_app/providers/firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: 350,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1.0),
          items: context.watch<FireStoreProvider>().allproducts!.map(
            (i) {
              log(i.toString());
              return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: i.image,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ));
            },
          ).toList(),
        ),
      ),
    );
  }
}
