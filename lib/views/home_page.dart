// import 'dart:convert';

// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:my_music/model/apimodel.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<List<Welcome>> futuremusic;
//   final player = AudioPlayer();
//   bool isPlaying = false;
//   //int currentIndex = 1;
//   //late Duration _currentPosition;


//   @override
//   void initState() {
//     futuremusic = fetchMusic();
//     player.onPositionChanged.listen((Duration duration) {
//       // setState(() {
//       //   _currentPosition = duration;
//       // });
//     });
//     super.initState();
//   }

//   void playPauseMusic(String url) {
//     if (isPlaying) {
//       player.pause();
//     } else {
//       player.play(UrlSource(url.toString()));
//     }
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       body: FutureBuilder(
//         future: fetchMusic(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xFF100A1C),
//                     Color(0xFF322251),
//                     Color(0xFF6886EF),
//                     Color(0xFF7368EF),
//                   ],
//                 ),
//               ),
//               child: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 26),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Icon(
//                             Icons.arrow_back,
//                             color: Colors.white,
//                           ),
//                           Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 snapshot.data![1].title,
//                                 style: textTheme.bodyMedium
//                                     ?.copyWith(color: Colors.green),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const SizedBox(
//                                     height: 4,
//                                   ),
//                                   Text(
//                                     snapshot.data![1].artist,
//                                     style: textTheme.bodyLarge
//                                         ?.copyWith(color: Colors.white),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                           const Icon(
//                             Icons.close,
//                             color: Colors.white,
//                           )
//                         ],
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Center(
//                           child: Container(
//                             width: double.maxFinite,
//                             height: 400,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(snapshot.data![1].artwork),
//                                 alignment: Alignment.topCenter,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       snapshot.data![1].title,
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 24,
//                                       ),
//                                     ),
//                                     Text(
//                                       snapshot.data![1].artist,
//                                       style:
//                                           const TextStyle(color: Colors.white),
//                                     )
//                                   ],
//                                 ),
//                                 const Icon(
//                                   Icons.favorite,
//                                   color: Colors.white,
//                                 )
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             ProgressBar(
//                               progress: const Duration(minutes: 1),
//                               total: const Duration(minutes: 6, seconds: 30),
//                               bufferedBarColor: Colors.white38,
//                               baseBarColor: Colors.white60,
//                               thumbColor: Colors.white,
//                               timeLabelTextStyle:
//                                   const TextStyle(color: Colors.white),
//                               progressBarColor: Colors.white,
//                               onSeek: (duration) {
//                                 print('User selected a new time: $duration');
//                               },
//                             ),
//                             const SizedBox(
//                               height: 16,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.lyrics,
//                                       color: Colors.white),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.skip_previous,
//                                       size: 36, color: Colors.white),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     playPauseMusic(snapshot.data![2].url);
//                                   },
//                                   icon: Icon(
//                                     isPlaying
//                                         ? Icons.pause_circle
//                                         : Icons.play_circle,
//                                     size: 60,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.skip_next,
//                                       size: 36, color: Colors.white),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {},
//                                   icon: const Icon(Icons.loop,
//                                       color: Colors.white),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }

// Future<List<Welcome>> fetchMusic() async {
//   final uri =
//       Uri.parse('https://run.mocky.io/v3/bef809ae-4d66-4ef7-a026-2731325d0393');
//   final response = await http.get(uri);

//   if (response.statusCode == 200) {
//     final jsonBody = jsonDecode(response.body) as List;
//     final musicJson =
//         jsonBody.map((musicJson) => Welcome.fromJson(musicJson)).toList();
//     return musicJson;
//   } else {
//     throw Exception('nooooo');
//   }
// }
import 'dart:convert';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:my_music/constants/fuciton_detailpage.dart';
import 'package:my_music/model/apimodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Welcome>> futuremusic;
  final player = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = 1; // Assuming you start with the second track

  @override
  void initState() {
    futuremusic = fetchMusic();
    super.initState();
  }

  void 
  playPauseMusic(String url) {
    if (isPlaying) {
      player.pause();
    } else {
      player.play(UrlSource(url.toString()));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void playNext(List<Welcome> musicList) {
    if (currentIndex < musicList.length - 1) {
      currentIndex++;
      playMusic(musicList[currentIndex].url);
    }
  }

  void playPrevious(List<Welcome> musicList) {
    if (currentIndex > 0) {
      currentIndex--;
      playMusic(musicList[currentIndex].url);
    }
  }

  void playMusic(String url) {
    if (isPlaying) {
      player.pause();
    } else {
      player.play(UrlSource(url.toString()));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: FutureBuilder(
        future: fetchMusic(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Welcome> musicList = snapshot.data as List<Welcome>;

            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF100A1C),
                    Color(0xFF322251),
                    Color(0xFF6886EF),
                    Color(0xFF7368EF),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                musicList[currentIndex].title,
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: Colors.green),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    musicList[currentIndex].artist,
                                    style: textTheme.bodyLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.close,
                            color: Colors.white,
                          )
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Container(
                            width: double.maxFinite,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    musicList[currentIndex].artwork),
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      musicList[currentIndex].title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      musicList[currentIndex].artist,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ProgressBar(
                              progress: const Duration(minutes: 1),
                              total: const Duration(minutes: 6, seconds: 30),
                              bufferedBarColor: Colors.white38,
                              baseBarColor: Colors.white60,
                              thumbColor: Colors.white,
                              timeLabelTextStyle:
                                  const TextStyle(color: Colors.white),
                              progressBarColor: Colors.white,
                              onSeek: (duration) {
                                player.seek(duration);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                   IconButton(
                                  onPressed: () {
                                    //playPrevious(musicList);
                                  },
                                  icon: const Icon(Icons.lyrics,
                                       color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    playPrevious(musicList);
                                  },
                                  icon: const Icon(Icons.skip_previous,
                                      size: 36, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    playPauseMusic(
                                        musicList[currentIndex].url);
                                  },
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause_circle
                                        : Icons.play_circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    playNext(musicList);
                                  },
                                  icon: const Icon(Icons.skip_next,
                                      size: 36, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.loop,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<List<Welcome>> fetchMusic() async {
  final uri =
      Uri.parse('https://run.mocky.io/v3/bef809ae-4d66-4ef7-a026-2731325d0393');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    final jsonBody = jsonDecode(response.body) as List;
    final musicJson =
        jsonBody.map((musicJson) => Welcome.fromJson(musicJson)).toList();
    return musicJson;
  } else {
    throw Exception('Failed to load music data');
  }
}
