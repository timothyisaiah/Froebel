import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:froebel/screens/GraderScreen.dart';
import 'package:froebel/screens/ReportsScreen.dart';
import 'package:froebel/screens/LearningScreen.dart';
import 'package:froebel/screens/ShopScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> _cardsToDisplay = <Widget>[
    Card(
      key: UniqueKey(),
      child: Column(
        children: const <Widget>[
          Image(
            image: AssetImage('./assets/images/shop.png'),
            height: 150,
            width: 150,
          ),
          Text('Shop'),
        ],
      ),
    ),
    Card(
      key: UniqueKey(),
      child: Column(
        children: const <Widget>[
          Image(
            image: AssetImage('./assets/images/grades.png'),
            height: 150,
            width: 150,
          ),
          Text('Grader'),
        ],
      ),
      // color: Colors.black45,
    ),
    Card(
      key: UniqueKey(),
      child: Column(
        children: const <Widget>[
          Image(
            image: AssetImage('./assets/images/learn.jpg'),
            height: 150,
            width: 150,
          ),
          Text('Learning'),
        ],
      ),
      // color: Colors.black45,
    ),
    Card(
      key: UniqueKey(),
      child: Column(
        children: const <Widget>[
          Image(
            image: AssetImage('./assets/images/report.png'),
            height: 150,
            width: 150,
          ),
          Text('Reports'),
        ],
      ),
    ),
  ];
  List<Widget> _classViews = <Widget>[
    ShopScreen(
      key: UniqueKey(),
    ),
    GraderScreen(
      key: UniqueKey(),
    ),
    LearningScreen(
      key: UniqueKey(),
    ),
    ReportsScreen(
      key: UniqueKey(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image(
                  image: AssetImage('./assets/images/froebel.png'),
                  height: 180,
                  width: 150,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    ' Welcome, Select option ',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.black45,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Expanded(
                SizedBox(
                  height: 600,
                  child: GridView.count(
                    shrinkWrap: true,
                    primary: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(_cardsToDisplay.length, (index) {
                      return InkWell(
                        child: _cardsToDisplay[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => _classViews[index]),
                          );
                        },
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
    );
  }
}
