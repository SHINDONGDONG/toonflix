class WebtoonModel {
  final String title,thumb,id;

  //json파일로 부터 받아야하니 String,dynamic json 파일을 : title = json['title]
  //다른것도 json body로부터 받아온 데이터들을 넣어준다.
  WebtoonModel.fromJson(Map<String,dynamic> json) :
      title = json['title'],
      thumb = json['thumb'],
      id = json['id'];
}