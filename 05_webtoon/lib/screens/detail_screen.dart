import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // late - 초기화하고 싶지만 constructor 에서 불가능하므로 initState 에서 초기화한다.
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isLiked = false;

  Future initPrefs() async {
    // 사용자의 기기 저장소에 connection
    prefs = await SharedPreferences.getInstance();
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      if (likedToons.contains(widget.id) == true) {
        setState(() {
          isLiked = true;
        });
      }
    } else {
      await prefs.setStringList('likedToons', []); // 최초로 실행 시에는 빈 배열
    }
  }

  @override
  void initState() {
    super.initState();

    // 부모와 별개의 클래스에서 작업하기 때문에 widget.id 라고 적어줘야 한다
    // initState 는 build 보다 먼저 실행되기 때문에 late 로 선언한 변수에 api 에서 받아온 값을 담아준다.
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
    initPrefs();
  }

  onHeartTap() async {
    final likedToons = prefs.getStringList('likedToons');
    if (likedToons != null) {
      isLiked ? likedToons.remove(widget.id) : likedToons.add(widget.id);
    }
    await prefs.setStringList('likedToons', likedToons!);
    setState(() => isLiked = !isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: onHeartTap,
              icon: Icon(isLiked
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded))
        ],
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        title: Text(
          widget
              .title, // 🌟 widget = DetailScreen (부모에게 가라). stateful widget 이라 필요하다
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id, // ✨webtoon의 Hero 위젯에서 받은 id와 연결된다
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(5, 5),
                              color: Colors.black.withOpacity(0.5),
                            )
                          ]),
                      clipBehavior:
                          Clip.hardEdge, // clipBehavior : 자식의 부모 영역 침범을 제어
                      width: 250,
                      child: Image.network(widget.thumb),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                future: webtoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  }
                  return const Text('...');
                },
              ),
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                future: episodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // episode 를 리턴하는 Future 가 10개만 리턴하기 때문에
                    // 많은 데이터를 최적화하기 좋은 ListViewBuilder 가 아닌 Container로 리턴
                    // (데이터가 많으면 ListView/Builder로 리턴)
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          Episode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  }
                  return Container(); // 데이터가 없으면 빈 컨테이너 리턴
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
