import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_launch/flutter_launch.dart';

import 'package:NexGoo/core/routes/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  bool err = false;
  String msgErr = '';
  void whatsAppOpen(String phoneNumber, String msg) async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(phone: phoneNumber, message: msg);
    } else {
      setState(() {
        err = false;
        msgErr = '';
      });
    }
  }

  Padding _buildtextSection(String text) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        text,
        softWrap: true,
      ),
    );
  }

  ElevatedButtonTheme _buildButtonSection(String phoneNumber, String msg) {
    return ElevatedButtonTheme(
      data: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(minimumSize: Size(170, 45))),
      child: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        children: [
          ElevatedButton(
            child: const Text('Back'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.home);
            },
          ),
          Center(
              child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Whatsapp",
                ),
                err ? Text(msgErr) : const Text('')
              ],
            ),
            onPressed: () {
              whatsAppOpen(phoneNumber, msg);
            },
          )),
        ],
      ),
    );
  }

  Container _buildSection(String ctitle, String description, String rating) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    ctitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(rating),
        ],
      ),
    );
  }

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    Object? s = ModalRoute.of(context)!.settings.arguments;
    log(s.toString());
    // TODO: implement build
    FirebaseFirestore.instance
        .collection('Lesson')
        .doc(s.toString())
        .update({"lesson_viewCount": FieldValue.increment(1)});

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.account_circle_rounded),
        title: Text("Nexgoo"),
        actions: [
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
          children: <Widget>[
            SizedBox(height: 50.0),
            GFCarousel(
              hasPagination: true,
              items: imageList.map(
                (url) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child:
                          Image.network(url, fit: BoxFit.cover, width: 1000.0),
                    ),
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  index;
                });
              },
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('Lesson').get(),
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
                            for (var a in documents)
                              if (a.id == s.toString())
                                Column(
                                  children: [
                                    _buildSection(
                                        a["lesson_title"],
                                        a["lesson_subtitle"],
                                        a["lesson_rating"].toString()),
                                    _buildtextSection(a["lesson_description"]),
                                  ],
                                ),
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

            // _buildSection("How to make a Pizza?",
            //     "I will teach you how to make a pizza in 3 days", "4"),
            // _buildtextSection(
            //     'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            //     'Alps. Situated 1,578 meters above sea level, it is one of the '
            //     'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            //     'half-hour walk through pastures and pine forest, leads you to the '
            //     'lake, which warms to 20 degrees Celsius in the summer. Activities '
            //     'enjoyed here include rowing, and riding the summer toboggan run.'),

            // _buildButtonSection("+85294380780", "hi")
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Material(
            color: const Color(0xff4696EC),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              child: const SizedBox(
                height: kToolbarHeight,
                width: 100,
                child: Center(
                  child: Text(
                    'Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xffFAFAFA)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: const Color(0xff2CB343),
              child: InkWell(
                onTap: () {
                  //print('called on tap');
                  launchUrlString(
                      'https://api.whatsapp.com/send?phone=85261231222&text=I%20want%20to%20make%20a%20booking');
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Whatsapp',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFAFAFA)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
