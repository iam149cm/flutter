// ✨ 추상화 클래스 abstract class : 상속받는 다른 메소드들이 구현해야 하는 메소드를 모아놓은 일종의 청사진.
abstract class Human {
  void walk();
}

class Player extends Human {
  // class 를 생성할 때 자료형은 반드시 명시되어야 한다.
  String name; // late 는 class 에서 유용하다
  XPLevel xp;
  int age = 1500;
  String team;
  TeamColor? teamColor; // enum 자료형을 사용할 수 있다

  Player(
      // 기본 constructor .. null 방지를 위한 required
      {
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

// ✨ API 로 부터 JSON 데이터를 받았을 경우의 초기화 방법
  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson['name'],
        xp = playerJson['xp'],
        team = playerJson['team'];

  // ✨ named constructor :인자를 2개만 받고 다른 값은 기본값으로 초기화하기.
  // : 는 클래스를 초기화하는 역할을 한다. syntax sugar.
  Player.createBluePlayer({required String name, required int age})
      : this.age = age,
        this.name = name,
        this.team = 'blue',
        this.xp = XPLevel.beginner;

  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name,
        this.team = 'red',
        this.xp = XPLevel.medium;

  // ✨  추상클래스의 메소드를 상속한 메소드
  void walk() {
    print("I'm walking");
  }

  void sayHello() {
    print("Hi my name is $name"); // dart class 안에서는 this 를 사용하지 않는다.
  }
}

class Coach extends Human {
  void walk() {
    print("The coach is walking");
  }
}

void main() {
  var player1 = Player(
    name: 'nico',
    xp: XPLevel.beginner,
    team: 'red',
    age: 12,
  ); // new 없어도 인스턴스가 생성된다.
  var player2 = Player(
    name: 'lynn',
    xp: XPLevel.pro,
    team: 'blue',
    age: 12,
  );
  player1.sayHello();
  player2.sayHello();

// 파라미터를 2개만 보내도 생성된다
  var player3 = Player.createBluePlayer(
    name: 'nico',
    age: 12,
  );
  var player4 = Player.createRedPlayer('lynn', 12);

  // ✨ api 로부터 데이터를 받는다고 가정
  var apiData = [
    {
      'name': 'nico',
      'team': 'red',
      'xp': 0,
    },
    {
      'name': 'dart',
      'team': 'red',
      'xp': 0,
    },
    {
      'name': 'lynn',
      'team': 'red',
      'xp': 0,
    }
  ];

  apiData.forEach((playerJson) {
    var player5 = Player.fromJson(playerJson);
    player5.sayHello();
  });

  // ✨ Syntax sugar!
  var nico = Player(
      name: 'nico',
      xp: XPLevel.beginner,
      team: 'red',
      age: 12) // 👈 여기 세미콜론이 없어야 한다. 아래와 같이 업데이트 하기 위함
    ..name = 'las'
    ..xp = XPLevel.medium
    ..team = 'blue'
    ..teamColor = TeamColor.blue
    ..sayHello();
  // nico.name = 'las'; nico.xp = 999; nico.team = 'blue'; 와 동일한 의미이다. 대신 세미콜론이 없어야 함

  // ✨ 상속된 class를 사용하기
  var playor = Playor(teem: Teem.red, name: 'nico');
  playor.sayHello(); // 부모를 상속받았기 때문에 메소드도 실행 가능하다
}

// ✨ enum 은 선택지를 줄여주고 실수를 방지한다.
enum TeamColor { red, blue } // '' 가 필요없다.

enum XPLevel { beginner, medium, pro }

// ✨ 상속
class Hooman {
  final String name;
  Hooman({required this.name});

  void sayHello() => print("Hi my name is $name");
}

enum Teem { blue, red }

class Playor extends Hooman with Strong, QuickRunner, Tall {
  // ✨ mixin 을 사용했다
  // 상속할 때 부모의 변수와 함수, 생성자를 가져온다.
  final Teem teem;
  // constructor with named argument
  Playor({
    required this.teem,
    required String name,
  }) : super(
            name:
                name); // playor 의 name 을 받아서 확장한 부모 클래스 Hooman (=super) 으로 전달 해 준다. 객체지향의 개념!

  // 부모의 함수 사용하기
  @override
  void sayHello() {
    super.sayHello();
    print('and I play for ${teem} ');
  }
}

// 🌟 Mixin - 생성자가 없는 클래스. 클래스에 프로퍼티를 추가하거나 할 때 사용한다.
// 사용하려면 다른 클래스에 with 를 쓰면 된다.
class Strong {
  final double StrengthLevel = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print('runnnnnnnnnnnnnnnnn!');
  }
}

class Tall {
  final double height = 1.99;
}

// 반복적으로 사용 가능
class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}
