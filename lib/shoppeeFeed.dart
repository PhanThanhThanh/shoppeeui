import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_example2/home_page.dart';
import 'package:flutter_example2/router.dart';
import 'package:flutter_example2/shoppeeFeed.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:carousel_slider/carousel_slider.dart';

enum Actions { Increment }
// Tạo một Action : Tăng
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

class FeedPage extends StatefulWidget {
  FeedPage({Key? key, required this.title}) : super(key: key);
  // final store<int> store;
  final String title;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final store = new Store<int>(counterReducer, initialState: 0);
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<int>(
        store: store,
        child: new MaterialApp(
          theme: new ThemeData.dark(),
          home: new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Shoppee Feed',
                textAlign: TextAlign.center,
              ),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    ' sdsdsd ',
                  ),
                  new StoreConnector<int, String>(
                    converter: (store) => store.state.toString(),
                    builder: (context, count) {
                      return new Text(
                        count,
                        style: Theme.of(context).textTheme.displaySmall,
                      );
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: new StoreConnector<int, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(Actions.Increment);
              },
              builder: (context, callback) {
                return FloatingActionButton(
                  onPressed: callback,
                  tooltip: 'search',
                  child: new Icon(
                    Icons.search,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
