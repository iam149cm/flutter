class WebtoonModel {
  final String title, thumb, id;

  WebtoonModel.fromJson(Map<String, dynamic> json) // π named constructor
      // νλμ κ°μ json μΌλ‘ λ°μ κ°μΌλ‘ fromJson μ ν΅ν΄ μ΄κΈ°ν
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
