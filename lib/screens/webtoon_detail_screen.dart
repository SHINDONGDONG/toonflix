import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import '../models/webtoon_detail_model.dart';
import '../widgets/episode_widget.dart';

class WebtoonDetailScreen extends StatefulWidget {
  final String title,thumb,id;

  const WebtoonDetailScreen(
      {Key? key,
        required this.title,
        required this.thumb,
        required this.id})
      : super(key: key);

  @override
  State<WebtoonDetailScreen> createState() => _WebtoonDetailScreenState();
}

class _WebtoonDetailScreenState extends State<WebtoonDetailScreen> {
  late Future<List<WebtoonEpisodeModel>> episodes;
  late Future<WebtoonDetailModel> webtoon;
  // late SharedPreferences prefs;
  // bool isLiked = false;

/*
  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []);
    }
  }
*/

  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if(likedToons != null) {
      if(likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
          print(isLiked);
        });
      }
    }else {
      await prefs.setStringList('likedToons', []);
    }
  }

/*  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeToonById(widget.id);
    initPrefs();
  }*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeToonById(widget.id);
    initPrefs();
  }



  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if(likedToons != null) {
      if(isLiked) {
        likedToons.remove(widget.id);
      }
    }else{
      likedToons!.add(widget.id);
    }

    // await prefs.setStringList('likedToons', likedToons!);
    setState(() {
      isLiked = !isLiked;
      print(isLiked);
    });
  }
/*
  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (isLiked) {
        likedToons.remove(widget.id);
      } else {
        likedToons.add(widget.id);
      }
      await prefs.setStringList('likedToons', likedToons);
      setState(() {
        isLiked = !isLiked;
      });
    }
  }
*/

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: onHeartTap, icon:
          Icon(
              isLiked ? Icons.favorite : Icons.favorite_outline),),
        ],
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                                offset: const Offset(10, 10),
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10),
                          ]
                      ),
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 15,),
                        RichText(
                          text: TextSpan(
                            text: snapshot.data!.genre,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: " / ",
                              ),
                              TextSpan(
                                text: snapshot.data!.age,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                            // child: Text(
                            //   '${snapshot.data!.genre} / ${snapshot.data!.age}',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                        ],
                      ),
                    );
                  }
                  return Text("...");
                },
              ),
              const SizedBox(height: 10,),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Column(
                      children: [
                        for(var episode in snapshot.data!)
                          Episode(episode: episode, webtoon_id:widget.id)
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

