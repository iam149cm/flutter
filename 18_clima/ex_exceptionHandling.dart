void main() {
  String myString1 = '15';
  String myString2 = 'abc';
  double myStringAsADouble;
  // 함수에서 사용하려면 함수 내의 전역으로 선언 후 try-catch 이후에 리턴
  // 🤍 Null Aware Operator : return someVariable ?? defaultValue

  try {
    // Do something that might fail
    myStringAsADouble = double.parse(myString2);
    // Compile 시에는 잡아낼 수 없는 Runtime error 발생 --> try-catch 로 잡아내길 원한다!
    print(myStringAsADouble + 5);
  } catch (e) {
    // Catch an exceptions that occur
    print(e);
  }

  someThingThatExpectsLessThan10(11); // try-catch 없이 throw 만 있으면 app 이 crash 된다
}

void someThingThatExpectsLessThan10(int n) {
  if (n > 10) {
    // we can't work the n larger than 10
    throw 'n is greater than 10, n should always be less than 10';
  }
}
