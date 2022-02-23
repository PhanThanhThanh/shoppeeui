import 'dart:html';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example2/Toi.dart';
import 'package:flutter_example2/main.dart';
import 'package:flutter_example2/shoppeeFeed.dart';
import 'package:flutter_example2/shoppeeLive.dart';
import 'package:flutter_example2/thongbao.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  var data = [
    {'image': 'assets/icon1.png', 'name': 'Khung gio san hang'},
    {'image': 'assets/icon2.png', 'name': 'ShopeePay'},
    {'image': 'assets/icon3.png', 'name': 'gi cung re - tu 1k'}
  ];
  var datas = [
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: shoppee feed',
      style: optionStyle,
    ),
    Text(
      'Index 2: Shoppee live',
      style: optionStyle,
    ),
    Text(
      'Index 3: thong bao',
      style: optionStyle,
    ),
    Text(
      'Index 4: Shoppee live',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget homePageUI() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        shadowColor: Colors.black,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
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
            items: datas.map((item) {
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
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 80,
                color: Color.fromARGB(235, 241, 238, 238),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_scanner,
                      color: Color.fromARGB(255, 241, 199, 10),
                      size: 30.0,
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 130,
                    color: Color.fromARGB(235, 241, 238, 238),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wallet_giftcard,
                              color: Color.fromARGB(255, 241, 199, 10),
                              size: 30.0,
                            ),
                            Text('Vi shoppeepay',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(
                          'giam den 10%',
                          style: TextStyle(fontSize: 10),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    height: 50,
                    width: 130,
                    color: Color.fromARGB(235, 241, 238, 238),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.money_off_csred_sharp,
                              color: Color.fromARGB(255, 241, 199, 10),
                              size: 30.0,
                            ),
                            Text('20.000',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text(
                          'doi xu lay ma giam gia',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 170,
            child: GridView.builder(
                padding: EdgeInsets.only(left: 15),
                itemCount: data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Column(
                        children: [
                          Image.asset(
                            data[index]['image'] ?? "",
                          ),
                          Text(
                            data[index]['name'] ?? "",
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }

  Widget pageUI() {
    if (_selectedIndex == 0) {
      return homePageUI();
    } else if (_selectedIndex == 1) {
      return FeedPage(title: "Feed");
    } else if (_selectedIndex == 2) {
      return LivePage(title: "Live");
    } else if (_selectedIndex == 3) {
      return Listproduct(title: " Rung");
    } else if (_selectedIndex == 4) {
      return Listproduct(title: "Toi");
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: pageUI(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 8, 8, 8)),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 241, 236, 236)),
          BottomNavigationBarItem(
              icon: Icon(Icons.feed, color: Colors.black),
              label: 'Shoppee Feed',
              backgroundColor: Color.fromARGB(255, 212, 64, 45)),
          //Navigator.pushNamed(context,Routers.Shop));
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv, color: Colors.black),
              label: 'Shoppee Live',
              backgroundColor: Color.fromARGB(255, 233, 228, 228)),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add, color: Colors.black),
              label: 'Thong bao',
              backgroundColor: Color.fromARGB(255, 118, 233, 156)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Toi',
              backgroundColor: Color.fromARGB(255, 184, 185, 245)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
