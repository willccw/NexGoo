import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NexGoo/core/routes/routes.dart';

class MyLessonScreen extends StatefulWidget {
  const MyLessonScreen({Key? key}) : super(key: key);

  @override
  _MyLessonState createState() => _MyLessonState();
}

class _MyLessonState extends State<MyLessonScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Nexgoo"),
        actions: const [
          // Container(
          //   width: 30,
          //   child: Image.asset(
          //     'images/lake.jpeg',
          //   ),
          // ),
          Icon(Icons.more_vert),
        ],
      ),
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.home);
                    },
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
            Row(
              children: <Widget>[
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'My lessons',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
