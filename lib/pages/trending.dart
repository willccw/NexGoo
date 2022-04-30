import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:NexGoo/core/routes/routes.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:getwidget/getwidget.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<TrendingScreen> {
  GFListTile _buildCoolCard(
      String ctitle, IconData cicon, String shortdes, int id) {
    return GFListTile(
        // https://docs.getwidget.dev/gf-tile/
        avatar: GFAvatar(),
        titleText: ctitle,
        subTitleText: shortdes,
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed(Routes.detail, arguments: id);
        },
        icon: Icon(cicon));
  }

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
                      'Trending',
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
                FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('Lesson')
                      .orderBy("lesson_viewCount")
                      .get(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        log('hasData');
                        return Center(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        log('hasData print');
                        final List<QueryDocumentSnapshot<Object?>>? documents =
                            snapshot.data?.docs;
                        if (documents != null) {
                          log(documents.length.toString());
                          return Container(
                            child: Column(
                              children: [
                                for (var i in documents)
                                  _buildCoolCard(
                                      i["lesson_title"],
                                      Icons.local_pizza,
                                      i["lesson_subtitle"],
                                      int.parse(i.id))
                              ],
                            ),
                          );
                        }
                        // for (var i in lessonList)
                        //   _buildCoolCard(i.title, Icons.local_pizza, i.subtitle);
                      }
                      //   return Center(
                      //       // here only return is missing
                      //       // child: Text(snapshot.data['email']));
                      // }
                    } else if (snapshot.hasError) {
                      log('hasData err');

                      return Text('no data');
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
