import 'package:flutter/material.dart';
import 'package:youtube_clone/data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WatchIt'),
        actions: [
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Icon(Icons.notifications_none),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: ids.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
              YoutubePlayer(
                  controller: YoutubePlayerController(
                      initialVideoId: ids[index]['id'],
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    )
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  ids[index]['title'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )
                ),
              ),
                        ],
                      ),
            );
      }),
    );
  }
}
