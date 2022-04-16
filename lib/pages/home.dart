import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:NexGoo/core/res/app.dart';
import 'package:NexGoo/core/routes/routes.dart';
import 'package:NexGoo/widgets/circle_gradient_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GFListTile _buildCoolCard(String ctitle, IconData cicon, String shortdes) {
    return GFListTile(
        // https://docs.getwidget.dev/gf-tile/
        avatar: GFAvatar(),
        titleText: ctitle,
        subTitleText: shortdes,
        onTap: () {
          Navigator.pushReplacementNamed(context, Routes.detail);
        },
        icon: Icon(cicon));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.fromSize(
          size: Size(70, 70),
          child: ClipOval(
            child: Material(
              color: Colors.amberAccent,
              child: InkWell(
                splashColor: Colors.green,
                onTap: () {
                  // Get.toNamed(AppRoutes.detailPage);
                  Navigator.pushReplacementNamed(context, Routes.category);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, color: color), // <-- Icon
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.hiking, 'Travel'),
        _buildButtonColumn(color, Icons.kitchen, 'Cook'),
        _buildButtonColumn(color, Icons.book, 'Learning'),
        _buildButtonColumn(color, Icons.sports_gymnastics, 'Sports'),
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Good Morning',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButtonTheme(
              data: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(minimumSize: Size(113, 45))),
              child: ButtonBar(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                    child: const Text('Discover'),
                    onPressed: () {},
                  ),
                  const ElevatedButton(
                    child: Text('Trending'),
                    onPressed: null,
                  ),
                  ElevatedButton(
                    child: const Text('My Lessons'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Text(
                'Category',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buttonSection,
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Learning',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 50,
                ),
                const Expanded(
                  child: Text(
                    'View more',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            _buildCoolCard("How To make a Pizza", Icons.local_pizza,
                "I will teach you  how to make a pizza in 3 days."),
            _buildCoolCard("How To make a Pizza", Icons.local_pizza,
                "I will teach you  how to make a pizza in 3 days."),
            _buildCoolCard("How To make a Pizza", Icons.local_pizza,
                "I will teach you  how to make a pizza in 3 days."),
          ],
        ),
      ),
    );
  }
}
