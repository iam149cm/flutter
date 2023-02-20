class Question {
  final String questionText;
  final bool questionAnswer;

  Question({required String q, required bool a})
      : this.questionText = q,
        this.questionAnswer = a;
}

/** ✨ Class     - ex) car
 * - Properties - ex) color, numberOfSeats
 * - Methods    - ex) drive(), break()
 *
 * 🤍 4 pillars of Object Oriented Programming
 *
 * 1. Abstraction 추상화
 * - 각자의 할 일을 하기 위해 역할을 나눈다. let's make it more modular!
 * - quiz 리스트를 quiz_brain.dart 파일로 분리하였다.
 *
 * 2. Encapsulation 캡슐화
 * - 웨이터는 쉐프의 일에 관여하지 않는다.
 * - main.dart 질문 text를 가져오기 위해 quiz_brain 내부의 요소에 바로 접근하여 값을 가져오는 건 맞지 않다.
 * - quiz_brain 에 질문 text 를 가져오는 함수를 작성하고 main에서 접근. 퀴즈의 List 는 private 처리하였다.
 * - questionNumber도 quiz_brain 안에 넣고 list의 index를 넘지 않게 체크하게 하였다
 *
 * 3. Inheritance 상속
 * - 부모가 가지고 있는 요소/메소드를 자식은 상속하여 가져다 쓴다. 부모는 별개로 자식만의 메소드를 만들어서 사용할 수 있다.
 * - 대표적으로 Stateless Widget, Stateful Widget 을 상속해서 사용하며 extends 키워드를 사용한다.
 * - super 키워드로 부모에게 접근할 수 있다.
 *
 * 4. Polymorphism 다형성
 * - 부모가 가지고 있는 메소드를 가져다 쓸 수 있다. 가져다 쓴 메소드의 내용물을 수정할 수 있다.
 * - @override 키워드를 사용한다. 모든 build 메소드에 붙어있다.
 *
 *
 */
