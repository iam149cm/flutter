import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    // await 로 쓰기 위해 async 가 필요하다.

    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');
    // get 👉 Future 자료형으로 반환받는다. (미래에 받을 값) await 와 같이 사용한다.
    // 요청이 처리될 때 까지 기다렸다 응답을 반환할 때 까지 ✨기다려야 한다. (await,async)
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(response.body); // 서버에서 반환받은 body를 json 으로 디코드한다

      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance); // 사용할 수 있는 dart 클래스로 받아온다
      }

      return webtoonInstances; // 아무것도 반환하지 않는다
    }
    throw Error();
  }

// 👉 웹툰 디테일 받아오기 API
  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url); // url 로 리퀘스트를 보내고
    if (response.statusCode == 200) {
      // 데이터가 있으면
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon); // json 으로 데이터를 바꿔준다
    } else {
      throw Error();
    }
  }

  // 👉 웹툰 에피소드 받아오기 API
  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url); // url 로 리퀘스트를 보내고

    if (response.statusCode == 200) {
      // 응답값이 정상이면
      final episodes = jsonDecode(response.body);

      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }

      return episodesInstances;
    } else {
      throw Error();
    }
  }
}
