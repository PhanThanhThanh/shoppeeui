import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_example2/home_page.dart';
import 'package:flutter_example2/router.dart';
import 'package:flutter_example2/shoppeeFeed.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ToiPage extends StatefulWidget {
  ToiPage({Key? key, required this.title}) : super(key: key);
  // final store<int> store;
  final String title;

  @override
  _ToiPageState createState() => _ToiPageState();
}

class _ToiPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Center(
      child: Container(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ),
    ));
  }
}
