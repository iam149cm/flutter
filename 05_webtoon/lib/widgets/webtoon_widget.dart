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
        // click π νμ΄μ§ μ΄λ!
        Navigator.push(
            // π Navigator λ‘ μ route λ₯Ό push ν΄ μ€λ€
            // route : MaterialPageRoute λ‘ λ§λ€μ΄μ‘λ€. StatelessWidget μ μ λλ©μ΄μ ν¨κ³Όλ‘ κ°μΈμ λ€λ₯Έ μ€ν¬λ¦°μ²λΌ λ³΄μ΄κ² ν΄μ€
            // MaterialPageRoute : DetailScreen (StatelessWidget) μ λ λνλ€.
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
            // β¨ μ λλ©μ΄μμ λΆμ¬νλ Hero μμ ―. ν¬μ€ν°λ₯Ό κ°μΈμ ν¬μ€ν°κ° μμ§μ΄κ² νλ€
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
              clipBehavior: Clip.hardEdge, // clipBehavior : μμμ λΆλͺ¨ μμ­ μΉ¨λ²μ μ μ΄
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
