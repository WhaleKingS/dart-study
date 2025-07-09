void printStar(var item) {
  print("\u{1F642} $item \u{1F642}");
}

enum Color { red, green, blue }

void main() {
  List ilist = [];
  ilist
    ..addAll([2, 1])
    ..add(0)
    ..sort((a, b) => a.compareTo(b));

  ilist.forEach(printStar);
  //

  void hello() {
    print("hello");
  }

  hello();

  //

  List list = [1, 2, 3];

  list.isEmpty ? print("empty") : print("no");
  // A?B:C a가 만족하면 b 아니면 c를 해라

  list.isEmpty
      ? print("empty")
      : list.first == 1
      ? print("첫번째 값은 1")
      : print("첫번째는 값은 1 아니다");

  ////////
  num var1 = 0x11;
  num var2 = 0xFF;
  print(var1);
  print(var2);

  num varI = int.parse('1');
  num varD = double.parse('1.1');
  print(varI);
  print(varD);

  print(Color.values);
  Color chColor = Color.red;
  print(chColor);

  // null 이 앞에 있으면 안 돌아간다.
  int iTemp = 3;
  int? nulliTemp;
  print(iTemp);
  print(nulliTemp); // int? 로 지정하면 멀 넣어도 결과는 null로 나옴
}
