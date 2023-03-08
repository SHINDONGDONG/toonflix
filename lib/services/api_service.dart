
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //async 펑션에선 비동기를 멈추고 데이터가 올때까지 기다린다.
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];

    final url = Uri.parse('$baseUrl/$today');
    //await이면 결과값을 기다림.
    final response = await http.get(url);
    if(response.statusCode==200) {
      //response.body에는 데이터가 들어가있다.
      final List<dynamic> webtoons = jsonDecode(response.body);
      for(var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    }
    throw Error();
  }
}

