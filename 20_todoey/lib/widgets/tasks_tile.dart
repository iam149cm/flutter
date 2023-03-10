import 'package:flutter/material.dart';

/* ๐ค ๋จ์ํ ํ๋์ Stateful Widget ์์ setState ๋ก local state๋ ๋ฐ๊ฟ ์ ์๋ค.
๊ทธ๋ฌ๋ ์์ ์์ ฏ ํธ๋ฆฌ์ ๋ค๋ฅธ ์์ (text ๋ฑ) ์ ์ํฅ์ ์ฃผ๋ ค๋ฉด global state๋ฅผ ๋ฐ๊ฟ์ผ ํ๋ค.
๐ ์์ ์์ ฏ ํธ๋ฆฌ ๋ธ๋๋ฅผ StatefulWidget์ผ๋ก ์ค์ ํ๊ณ , state๋ฅผ ๋ณ๊ฒฝํ  ๋ณ์๋ฅผ ๋ฃ์ ํ ํ์ StatelessWidet ์์ ๋ณ๊ฒฝ

๐ค StatefulWidget - ์ํฉ์ ๋ฐ๋ผ ํ๋ค ์ ์๋ค ํ  ์ ์๋ ๋ณ์  ํ์ด๋ธ. final ๋ก ๋ณ์ ์ ์ธ ๋ถ๊ฐ (state ๊ฐ ๋ฐ๋์ด์ผ ํ๋๊น)
๐ค StatelessWidget - ๊ทธ๋ฅ ํ์ด๋ธ
*/ ///

class TaskTile extends StatelessWidget {
// ๐ค 0. task๋ฅผ ๋ถ๋ฆฌํจ์ผ๋ก์จ stateful -> stateless widget ์ผ๋ก ๋ณ๊ฒฝํ์์
// ๐ค 1. state ๋ก ๋ถํฐ statefulWidget ์ create
// ๐ค 2. ์ค์  state object. ๊ฐ์ด ๋ฐ๋๋ ๋ณ์๊ฐ ๋ค์ด์๋ค.
  final bool isChecked; // ๐ ์ค์  state๋ฅผ ๋ณ๊ฒฝํ  ๋ณ์๋ statefulWidget ์์ ๋ค์ด์๋ค
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  // ๐ค 3. ๋ณ์์ state๊ฐ ๋ฐ๋๋ฉด build ๋ฉ์๋์์ UI ๋ฅผ ์๋ฐ์ดํธ ํด ์ค๋ค.
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      // title - ์ฒ์์ ๋ฌด์์ด ์ฌ ๊ฒ์ธ๊ฐ
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      // trailing - ๋ง์ง๋ง์ ๋ฌด์์ด ์ฌ ๊ฒ์ธ๊ฐ
      trailing: Checkbox(
        shape: CircleBorder(),
        value: isChecked,
        activeColor: Colors.teal.shade200,
        onChanged: checkboxCallback, // checkbox ๊ฐ ๋ณ๊ฒฝ๋  ๋ callback ์ด trigger ๋๋ค
      ),
    );
  }
}

// ๐ค 4. final ์ด๋ฏ๋ก ์ฌ๊ธฐ์ ์์์ state๋ฅผ ๋ณ๊ฒฝํ  ์๋ ์๋ค.
// ๐ค 5. ๊ทธ๋ฌ๋ ์๋ฐ์ดํธ๊ฐ ํ์ํ๋ฉด ์์ฑ์๋ฅผ ํตํด ์๋กญ๊ฒ ์ด๊ธฐํํ๊ณ  ์ด์ ์ ๊ฒ์ ๋ฒ๋ฆฐ๋ค
// ๐ค 6. Lifted up to the parent widget (TaskCheckbox --> TaskTile) ์ฆ, ์์ ฏํธ๋ฆฌ์ ๋ถ๋ชจ ๋ธ๋๋ก ๊ฐ์ ์ฌ๋ฆฐ๋ค.
