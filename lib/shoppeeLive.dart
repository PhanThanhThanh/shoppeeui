import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_example2/home_page.dart';
import 'package:flutter_example2/router.dart';
import 'package:flutter_example2/shoppeeFeed.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:carousel_slider/carousel_slider.dart';

// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.
// This class is the configuration for the state. It holds the values (in this
// case the title) provided by the parent (in this case the App widget) and
// used by the build method of the State. Fields in a Widget subclass are
// always marked "final".

var data = [
  {
    'image': 'assets/image1.png',
  },
  {
    'image': 'assets/image2.png',
  },
  {
    'image': 'assets/image3.png',
  }
];

class LivePage extends StatefulWidget {
  LivePage({Key? key, required this.title}) : super(key: key);
  // final store<int> store;
  final String title;
  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  final store = new Store<int>(counterReducer, initialState: 0);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: data.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(
                  item['image'] ?? "",
                ));
          },
        );
      }).toList(),
    );
  }
}
