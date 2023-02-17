import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // click 👉 페이지 이동!
        Navigator.push(
            // 🌟 Navigator 로 새 route 를 push 해 준다
            // route : MaterialPageRoute 로 만들어졌다. StatelessWidget 을 애니메이션 효과로 감싸서 다른 스크린처럼 보이게 해줌
            // MaterialPageRoute : DetailScreen (StatelessWidget) 을 렌더한다.
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id),
              // fullscreenDialog: true,
            ));
      },
      child: Column(
        children: [
          Hero(
            // ✨ 애니메이션을 부여하는 Hero 위젯. 포스터를 감싸서 포스터가 움직이게 한다
            tag: id,
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
              clipBehavior: Clip.hardEdge, // clipBehavior : 자식의 부모 영역 침범을 제어
              width: 250,
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 22,
              )),
        ],
      ),
    );
  }
}
