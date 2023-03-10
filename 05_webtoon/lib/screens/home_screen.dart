import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

// API 로 부터 값을 받아오기
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        title: const Text(
          "✨ 오늘의 웹툰 ✨",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: FutureBuilder(
        // ✨👉 stateful widget 을 쓸 필요가 없다. widget 이 데이터를 기다려주고 데이터에 따라 다른 ui 를 보여준다.
        future: webtoons,
        builder: (context, snapshot) {
          // snapshot : state of the future
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  // Expanded : 화면의 남는 공간을 차지하는 widget
                  child: makeList(snapshot),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      scrollDirection: Axis.horizontal, // 스크롤 방향 설정이 가능하다.
      itemCount: snapshot.data!.length, // dart 에게 데이터가 몇개인지 미리 알려준다
      itemBuilder: (context, index) {
        // 데이터를 뿌려준다. List에서 사용자가 보고 있는 아이템만 build 한다
        var webtoon = snapshot.data![index];

        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 40), // 아이템 사이에 구분자를 넣어준다
    );
  }
}
