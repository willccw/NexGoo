import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_launch/flutter_launch.dart';

import 'package:NexGoo/core/routes/routes.dart';

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
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
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
            _buildSection("How to make a Pizza?",
                "I will teach you how to make a pizza in 3 days", "4"),
            _buildtextSection(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.'),
            _buildButtonSection("+85294380780", "hi")
          ],
        ),
      ),
    );
  }
}
