import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';
import '../models/webtoon_model.dart';

class WebToonScreen extends StatelessWidget {

  Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        //api 데이터가 들어올곳.
        future: webtoons,
        //snapshot으로 future의 데이터가 들어왔는지 아닌지 확인이 가능함.
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Text("There is data!");
          }
          return Text("Loading.....");
        }

      ),
    );
  }
}
