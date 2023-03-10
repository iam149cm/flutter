class Question {
  final String questionText;
  final bool questionAnswer;

  Question({required String q, required bool a})
      : this.questionText = q,
        this.questionAnswer = a;
}

/** β¨ Class     - ex) car
 * - Properties - ex) color, numberOfSeats
 * - Methods    - ex) drive(), break()
 *
 * π€ 4 pillars of Object Oriented Programming
 *
 * 1. Abstraction μΆμν
 * - κ°μμ ν  μΌμ νκΈ° μν΄ μ­ν μ λλλ€. let's make it more modular!
 * - quiz λ¦¬μ€νΈλ₯Ό quiz_brain.dart νμΌλ‘ λΆλ¦¬νμλ€.
 *
 * 2. Encapsulation μΊ‘μν
 * - μ¨μ΄ν°λ μνμ μΌμ κ΄μ¬νμ§ μλλ€.
 * - main.dart μ§λ¬Έ textλ₯Ό κ°μ Έμ€κΈ° μν΄ quiz_brain λ΄λΆμ μμμ λ°λ‘ μ κ·Όνμ¬ κ°μ κ°μ Έμ€λ κ±΄ λ§μ§ μλ€.
 * - quiz_brain μ μ§λ¬Έ text λ₯Ό κ°μ Έμ€λ ν¨μλ₯Ό μμ±νκ³  mainμμ μ κ·Ό. ν΄μ¦μ List λ private μ²λ¦¬νμλ€.
 * - questionNumberλ quiz_brain μμ λ£κ³  listμ indexλ₯Ό λμ§ μκ² μ²΄ν¬νκ² νμλ€
 *
 * 3. Inheritance μμ
 * - λΆλͺ¨κ° κ°μ§κ³  μλ μμ/λ©μλλ₯Ό μμμ μμνμ¬ κ°μ Έλ€ μ΄λ€. λΆλͺ¨λ λ³κ°λ‘ μμλ§μ λ©μλλ₯Ό λ§λ€μ΄μ μ¬μ©ν  μ μλ€.
 * - λνμ μΌλ‘ Stateless Widget, Stateful Widget μ μμν΄μ μ¬μ©νλ©° extends ν€μλλ₯Ό μ¬μ©νλ€.
 * - super ν€μλλ‘ λΆλͺ¨μκ² μ κ·Όν  μ μλ€.
 *
 * 4. Polymorphism λ€νμ±
 * - λΆλͺ¨κ° κ°μ§κ³  μλ λ©μλλ₯Ό κ°μ Έλ€ μΈ μ μλ€. κ°μ Έλ€ μ΄ λ©μλμ λ΄μ©λ¬Όμ μμ ν  μ μλ€.
 * - @override ν€μλλ₯Ό μ¬μ©νλ€. λͺ¨λ  build λ©μλμ λΆμ΄μλ€.
 *
 *
 */
