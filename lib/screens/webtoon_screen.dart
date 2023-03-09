import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';
import '../models/webtoon_model.dart';

class WebToonScreen extends StatelessWidget {

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

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
            //ListView.separated는 리스트사이에
            //widget을 낑겨서 넣을 수 있는 리스트이다.
            return ListView.separated(
                  itemBuilder: (context, index){
                    var webtoon = snapshot.data![index];
                    return Text(webtoon.title);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.length,
              //여기서 SizedBox를 위젯으로 넣어서 데이터들 사이에 띄워짐이 보인다.
                  separatorBuilder: (BuildContext context, int index) {
                    print(index);
                    return SizedBox(width: 10);
                  },);
              //ListView.builder를 사용하면 메모리를 잘 활용할 수 있다.
            // return ListView.builder(
            //   //require 세 개 항목
            //   scrollDirection: Axis.horizontal,
            //   itemCount: snapshot.data!.length,
            //   //우리가 보지않고있으면 메모리에서 삭제하고 보고있는것만 빌드할것임.
            //   //인덱스로
            //   itemBuilder: (BuildContext context, int index) {
            //     //snapshot은 리스트이기때문에 인덱스로 하나씩돌린다.
            //     var webtoon = snapshot.data![index];
            //     return Text(webtoon.title);
            //   },
            //
            // );
          }
          return Center(
              child: RefreshProgressIndicator(),
            );
          }

      ),
    );
  }
}
