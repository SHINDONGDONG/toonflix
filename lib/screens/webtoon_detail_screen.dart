import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebtoonDetailScreen extends StatelessWidget {
  final String title,thumb,id;

  const WebtoonDetailScreen(
      {Key? key, required this.title, required this.thumb, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                child: Image.network(thumb),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
