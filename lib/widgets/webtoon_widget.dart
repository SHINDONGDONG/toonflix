import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/webtoon_detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title,thumb,id;

  const Webtoon({Key? key, required this.title, required this.thumb, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) =>
                WebtoonDetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              //안쪽 컨텐츠가 깎이면 따라서 깎이게 만든다.
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    //박스 쉐도우를 주는데 처음엔 레드이런색으로 먼저 자리를잡아준다.
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(10,10),
                      color: Colors.black.withOpacity(0.3),

                    ),
                  ]
              ),

              child: Image.network(thumb),
              ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
