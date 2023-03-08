import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';
import '../models/webtoon_model.dart';

class WebToonScreen extends StatefulWidget {
  const WebToonScreen({Key? key}) : super(key: key);

  @override
  State<WebToonScreen> createState() => _WebToonScreenState();
}

class _WebToonScreenState extends State<WebToonScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService().getTodaysToons();
    isLoading = false;
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    waitForWebtoons();
  }
  @override
  Widget build(BuildContext context) {

    print(webtoons);
    print(isLoading);

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
    );
  }
}
