import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:NexGoo/core/res/app.dart';
import 'package:NexGoo/core/routes/routes.dart';
import 'package:NexGoo/widgets/circle_gradient_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Category {
  late int id;
  late IconData icon;
  late String label;
  Category(this.id, this.icon, this.label);
}

class Lesson {
  late int id;
  late String title;
  late int category;
  late int owner;
  late String subtitle;
  late int viewcount;

  Lesson(this.id, this.title, this.category, this.owner, this.subtitle,
      this.viewcount);
}

class _HomeScreenState extends State<HomeScreen> {
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

  Column _buildButtonColumn(Color color, IconData icon, String label, int id) {
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
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.category, arguments: id);
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
  bool trending = false;
  bool myLesson = false;
  Widget build(BuildContext context) {
    List<Lesson> lessonList = [];

    // Future<String> getEmail() async {
    //   var x = await FirebaseFirestore.instance();
    //   FirebaseFirestore.instance
    //       .collection('Lesson')
    //       .get()
    //       .then((QuerySnapshot querySnapshot) {
    //     return querySnapshot;
    //     // for (var doc in querySnapshot.docs) {
    //     //   // log(doc.id);
    //     //   lessonList.add(Lesson(
    //     //       int.parse(doc.id),
    //     //       doc["lesson_title"],
    //     //       doc["lesson_category"],
    //     //       doc["lesson_owner"],
    //     //       doc["lesson_subtitle"],
    //     //       doc["lesson_viewCount"]));
    //     // }
    //   });
    //   return x;
    // }

    List<Category> categoryList = [];

    Color color = Theme.of(context).primaryColor;

    categoryList.add(Category(categoryList.length, Icons.hiking, 'Travel'));
    categoryList.add(Category(categoryList.length, Icons.kitchen, 'Cook'));
    categoryList.add(Category(categoryList.length, Icons.book, 'Learning'));
    categoryList
        .add(Category(categoryList.length, Icons.sports_gymnastics, 'Sports'));

    // categoryList[0].icon = Icons.hiking;
    // categoryList[0].label = 'Travel';
    // categoryList[1].icon = Icons.kitchen;
    // categoryList[1].label = 'Cook';
    // categoryList[2].icon = Icons.book;s
    // categoryList[2].label = 'Learning';
    // categoryList[3].icon = Icons.sports_gymnastics;
    // categoryList[3].label = 'Sports';

    Widget buttonSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // _buildButtonColumn(color, Icons.hiking, 'Travel'),
          // _buildButtonColumn(color, Icons.kitchen, 'Cook'),
          // _buildButtonColumn(color, Icons.book, 'Learning'),
          // _buildButtonColumn(color, Icons.sports_gymnastics, 'Sports'),
          for (var i in categoryList)
            _buildButtonColumn(color, i.icon, i.label, i.id)
        ]

        // List.generate(categoryList.length, (index) => {
        //   return _buildButtonColumn(color, categoryList[index].icon,categoryList[index].label)
        // })
        );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
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
                    onPressed: () =>
                        setState(() => {trending = false, myLesson = false}),
                  ),
                  ElevatedButton(
                    child: const Text('Trending'),
                    onPressed: () =>
                        setState(() => {trending = true, myLesson = false}),

                    //   log(trending.toString());
                    //   // Navigator.pushReplacementNamed(context, Routes.myLesson);
                    // },
                  ),
                  ElevatedButton(
                    child: const Text('My Lessons'),
                    onPressed: () =>
                        setState(() => {trending = false, myLesson = true}),

                    // onPressed: () {
                    //   log('dddkkk');
                    //   Navigator.pushReplacementNamed(context, Routes.myLesson);
                    // },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            if (!myLesson)
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (!myLesson) buttonSection,

            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      myLesson
                          ? 'My lesson'
                          : !trending
                              ? 'Learning'
                              : 'Trending',
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
            // FutureBuilder(builder: builder)
            // for (var i in lessonList)
            //   _buildCoolCard(i.title, Icons.local_pizza, i.subtitle)

            FutureBuilder<QuerySnapshot>(
              future: trending
                  ? FirebaseFirestore.instance
                      .collection('Lesson')
                      .orderBy("lesson_viewCount", descending: true)
                      .get()
                  : FirebaseFirestore.instance.collection('Lesson').get(),
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
                      return Column(
                        children: [
                          if (myLesson)
                            for (var i in documents)
                              if (i["lesson_owner"] == 0)
                                _buildCoolCard(
                                    i["lesson_title"],
                                    Icons.local_pizza,
                                    i["lesson_subtitle"],
                                    int.parse(i.id))
                              else
                                Container()
                          else
                            for (var i in documents)
                              _buildCoolCard(
                                  i["lesson_title"],
                                  Icons.local_pizza,
                                  i["lesson_subtitle"],
                                  int.parse(i.id))
                        ],
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

            // _buildCoolCard("How To make a Pizza", Icons.local_pizza,
            //     "I will teach you  how to make a pizza in 3 days."),
            // _buildCoolCard("How To make a Pizza", Icons.local_pizza,
            //     "I will teach you  how to make a pizza in 3 days."),
            // _buildCoolCard("How To make a Pizza", Icons.local_pizza,
            //     "I will teach you  how to make a pizza in 3 days."),
          ],
        ),
      ),
    );
  }
}
