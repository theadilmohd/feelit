import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_music/constants/colors.dart';
import 'package:my_music/widgets/songimage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color songColor = const Color.fromARGB(255, 56, 6, 3);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    String artistName = 'Arjith Sing';
    String songName = 'hawayein';
    return Scaffold(
      backgroundColor: songColor,
      body: SafeArea(
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
                        songName,
                        style:
                            textTheme.bodyMedium?.copyWith(color: Colors.green),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.white,
                            // backgroundImage: NetworkImage(''),
                            radius: 10,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            artistName,
                            style: textTheme.bodyLarge
                                ?.copyWith(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                ],
              ),
              const Expanded(
                flex: 2,
                child: Center(
                  child: SongImage(
                      image:
                          'https://samplesongs.netlify.app/album-arts/bad-liar.jpg'),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            songName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Text(artistName,
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ProgressBar(
                    progress: const Duration(minutes: 1000),
                    //buffered: Duration(milliseconds: 2000),
                    total: const Duration(minutes: 6, seconds: 30),
                    bufferedBarColor: Colors.white38,
                    baseBarColor: Colors.white60,
                    thumbColor: Colors.white,
                    timeLabelTextStyle: const TextStyle(color: Colors.white),
                    progressBarColor: Colors.white,
                    onSeek: (duration) {
                      print('User selected a new time: $duration');
                    },
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: (){},
                         icon:Icon(Icons.lyrics,color: Colors.white,)),
                      IconButton(
                        onPressed: (){},
                         icon:Icon(Icons.skip_previous,size: 36,color: Colors.white,)),
                         IconButton(
                        onPressed: (){},
                         icon:Icon(Icons.play_circle,size: 60,color: Colors.white,)),
                         IconButton(
                        onPressed: (){},
                         icon:Icon(Icons.skip_next,size: 36,color: Colors.white,)),
                         IconButton(
                        onPressed: (){},
                         icon:Icon(Icons.loop,color: Colors.white,))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
