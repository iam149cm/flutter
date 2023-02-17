class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json) // 👉 named constructor
      // 필드의 값을 json 으로 받은 값으로 fromJson 을 통해 초기화
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
