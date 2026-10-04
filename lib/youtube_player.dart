import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final videoUrls = [
  'https://youtu.be/1wBpX0iFl5E?si=Gjihd99vdLZfMVDU',
  'https://youtu.be/ABMptqSJD_w?si=NQqvB01p2daNdwAs',
  'https://www.youtube.com/watch?v=JSqUZFkRLr8',
  'https://www.youtube.com/watch?v=qEZf2q4W20g',
  'https://www.youtube.com/watch?v=jCbclWBV32o'
];

final video_title = [
  'How To Join Swiggy Delivery boy job online ll Swiggy delivery boy job Apply Online ll 111111',
  'How To Join Swiggy Delivery boy job online ll Swiggy delivery boy job Apply Online ll 2222222',
  'How To Join Swiggy Delivery boy job online ll Swiggy delivery boy job Apply Online ll 22222222',
  'How To Join Swiggy Delivery boy job online ll Swiggy delivery boy job Apply Online ll 222222',
  'How To Join Swiggy Delivery boy job online ll Swiggy delivery boy job Apply Online ll 222222',
];

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Future<void>? _launched;
  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.youtube.com/watch?v=WcZ8lTRTNM0';

    return Scaffold(
     


 appBar: AppBar(
        title: Text(
          "Ride Guide",
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 5, 71, 84),
        iconTheme: IconThemeData(
          color:
              const Color.fromARGB(255, 255, 255, 255), //change your color here
        ),
      ),



      body: ListView.builder(
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final videoID = YoutubePlayer.convertUrlToId(videoUrls[index]);

          return InkWell(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(videoUrls[index]);
                });
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PLayerScreen(videoId: videoID)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    color: Color.fromARGB(255, 207, 206, 204),
                    height: 120,
                    width: 100,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                    YoutubePlayer.getThumbnail(
                                        videoId: videoID!),
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(flex: 3, child: Text(video_title[index]))
                          ],
                        ),
                      ],
                    )),
              ));
        },
      ),
    );
  }

  Widget thubmNail() {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(10),
      color: Colors.blue,
      child: const Center(
        child: Text("THUMBNAIL"),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

// import 'dart:convert';
}
